package dingpiao.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.deploy.net.HttpResponse;
import dingpiao.dao.*;
import dingpiao.model.*;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import dingpiao.dao.UserDAO;
import dingpiao.util.Pager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class AdminAction extends ActionSupport {

    private static final long serialVersionUID = -4304509122548259589L;

    private AnnouncementDAO announcementDAO;

    private OrderDAO orderDAO;

    private RouteDAO routeDAO;

    private ScheduleDAO scheduleDAO;

    private TicketDAO ticketDAO;

    private UserDAO userDAO;

    private AdminDAO adminDAO;

    private BusDAO busDAO;

    private BusTypeDAO busTypeDAO;

    private PassengerDAO passengerDAO;

    private StationDAO stationDAO;

    private WordDAO wordDAO;

    private String url = "./";

    public WordDAO getWordDAO() {
        return wordDAO;
    }

    public void setWordDAO(WordDAO wordDAO) {
        this.wordDAO = wordDAO;
    }

    public AnnouncementDAO getAnnouncementDAO() {
        return announcementDAO;
    }

    public void setAnnouncementDAO(AnnouncementDAO announcementDAO) {
        this.announcementDAO = announcementDAO;
    }

    public OrderDAO getOrderDAO() {
        return orderDAO;
    }

    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    public RouteDAO getRouteDAO() {
        return routeDAO;
    }

    public void setRouteDAO(RouteDAO routeDAO) {
        this.routeDAO = routeDAO;
    }

    public ScheduleDAO getScheduleDAO() {
        return scheduleDAO;
    }

    public void setScheduleDAO(ScheduleDAO scheduleDAO) {
        this.scheduleDAO = scheduleDAO;
    }

    public TicketDAO getTicketDAO() {
        return ticketDAO;
    }

    public void setTicketDAO(TicketDAO ticketDAO) {
        this.ticketDAO = ticketDAO;
    }

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public AdminDAO getAdminDAO() {
        return adminDAO;
    }

    public void setAdminDAO(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public BusDAO getBusDAO() {
        return busDAO;
    }

    public void setBusDAO(BusDAO busDAO) {
        this.busDAO = busDAO;
    }

    public BusTypeDAO getBusTypeDAO() {
        return busTypeDAO;
    }

    public void setBusTypeDAO(BusTypeDAO busTypeDAO) {
        this.busTypeDAO = busTypeDAO;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String index() throws Exception {
        this.setUrl("index.jsp");
        return SUCCESS;
    }

    public PassengerDAO getPassengerDAO() {
        return passengerDAO;
    }

    public void setPassengerDAO(PassengerDAO passengerDAO) {
        this.passengerDAO = passengerDAO;
    }

    public void login() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        Admin admin = adminDAO.selectBean(" where name ='" + name + "' and password = '" + password + "'");
        if (admin == null) {
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('用户名或者密码错误');window.location.href='login" +
                    ".jsp';</script>");
        } else if (admin.getStatus() == 1) {
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('该用户已被停用！');window.location.href='login" +
                    ".jsp';</script>");
        }
        HttpSession session = request.getSession();
        session.setAttribute("admin", admin);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html; charset=gbk");
        response.getWriter().print("<script language=javascript>window.location.href='./index.jsp';</script>");
    }

    public String logout() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        this.setUrl("login.jsp");
        return SUCCESS;
    }

    public void changePassword() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();

        String pwd1 = request.getParameter("password1");
        String pwd2 = request.getParameter("password2");
        Admin logedInAdmin = (Admin) session.getAttribute("admin");
        if (logedInAdmin == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='manage/login" +
                    ".jsp';</script>");
            return;
        }
        String name = logedInAdmin.getName();
        Admin admin = adminDAO.selectBean("where name = '" + name + "' and password = '" + pwd1 + "'");
        if (admin != null) {
            admin.setPassword(pwd2);
            adminDAO.updateBean(admin);
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('修改成功,请重新登录！');window.location" +
                    ".href='manage/login.jsp';</script>");
        } else {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('用户名或者密码错误');window.location" +
                    ".href='manage/login.jsp';</script>");
        }
    }

    public String profile() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if (null == admin) {
            return null;
        }
        request.setAttribute("title","个人信息");
        request.setAttribute("user", admin);
        this.setUrl("manage/personalinfo.jsp");
        return SUCCESS;
    }

    public void modifyProfile() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        Admin admin_check = (Admin) session.getAttribute("admin");
        String check_name = admin_check.getName();
        if (admin_check == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='manage/login.jsp';" +
                    "</script>");
            return;
        }
        Admin admin = adminDAO.selectBean("where id='" + admin_check.getId() + "'");
        String name= request.getParameter("name");
        admin.setName(name);
        admin.setRealName(request.getParameter("realName"));
        admin.setPhone(request.getParameter("phone"));
        admin.setIDNumber(request.getParameter("idNumber"));
        admin.setSex(request.getParameter("sex"));
        int check = adminDAO.selectBeanCount(" where name='" + admin.getName()+ "'");
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (check != 0 && !name.equals(check_name)) {
            response.getWriter().print("<script language=javascript>alert('修改失败,用户名已存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return;
        }
        adminDAO.updateBean(admin);
        session.setAttribute("admin", admin);
        response.getWriter().print("<script language=javascript>alert('修改成功');window.location" +
                ".href='manage/index.jsp;';</script>");

    }

    public String adminManage() throws Exception {
        Admin admin = (Admin) ServletActionContext.getRequest().getSession().getAttribute("admin");
        /*
        if(null == admin || admin.getRole() != 1){
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('您没有查看权限');</script>");
            return null;
        }*/
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where name like '%" + keyWord + "%' or id ='" + keyWord + "'");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append(" order by id desc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = adminDAO.selectBeanCount("");
        request.setAttribute("list", adminDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage,
                "adminMethod!adminManage", "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!adminManage");
        request.setAttribute("urlSetLock", "../adminMethod!adminSetLock");
        request.setAttribute("urlReleaseLock", "../adminMethod!adminReleaseLock");
        request.setAttribute("urlResetpwd","../adminMethod!adminResetpwd");
        request.setAttribute("urlCreate", "../adminMethod!adminCreate");
        request.setAttribute("title","车站管理员");
        List<Station> stationlist = stationDAO.selectBeanList(0, 999, "");
        request.setAttribute("stationlist", stationlist);
        this.setUrl("/manage/stationmanager.jsp");
        return SUCCESS;
    }

    public void adminCreate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");

        Admin admin = new Admin();
        admin.setName(request.getParameter("name"));
        admin.setPassword(request.getParameter("password"));
        admin.setCreatetime(new Date());
        admin.setRole(1);
        admin.setRealName(request.getParameter("realName"));
        admin.setIDNumber(request.getParameter("idNumber"));
        admin.setSex(request.getParameter("sex"));
        admin.setPhone(request.getParameter("phone"));
        String stationName = request.getParameter("stationName");
        Station station = stationDAO.selectBean(" where name='"+stationName+"'");
        if(station == null){
            response.getWriter().print("<script language=javascript>alert('创建失败,站点不存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return;
        }
        admin.setStation(station);

        int check = adminDAO.selectBeanCount(" where name='" + admin.getName() + "'");
        if (check != 0) {
            response.getWriter().print("<script language=javascript>alert('创建失败,用户名已存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return;
        }
        adminDAO.insertBean(admin);
        response.getWriter().print("<script language=javascript>alert(\"创建车站管理员成功,初始密码为'" + admin.getPassword() + "'\")" +
                ";window.location.href='manage/index.jsp';</script>");
    }

    public void adminSetLock() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        Admin admin = adminDAO.selectBean("where id = " + id);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (admin.getStatus() == 1) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('该用户已停用！修改失败');window.location.href='manage/index.jsp';$('#adminManage').click();" +
                    "</script>");
            return;
        } else if (admin != null) {
            admin.setStatus(1);
            adminDAO.updateBean(admin);
        } else {
            response.getWriter().print("<script language=javascript>alert('修改失败');window.location.href='manage/index.jsp';$('#adminManage').click();</script>");
            return;
        }
        response.getWriter().print("<script language=javascript>alert('修改成功');window.location.href='manage/index.jsp';$('#adminManage').click();</script>");
    }

    public void adminReleaseLock() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        Admin admin = adminDAO.selectBean("where id = " + id);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (admin.getStatus() == 0) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('该用户已启用！修改失败');window.location.href='manage/index.jsp';" +
                    "</script>");
            return;
        } else if (admin != null) {
            admin.setStatus(0);
            adminDAO.updateBean(admin);
        } else {
            response.getWriter().print("<script language=javascript>alert('修改失败');window.location.href='manage/index.jsp';</script>");
            return;
        }
        response.getWriter().print("<script language=javascript>alert('修改成功');window.location.href='manage/index.jsp';</script>");
    }
    public void adminResetpwd() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        Admin admin = adminDAO.selectBean("where id = " + id);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (admin != null) {
            admin.setPassword("123456");
            adminDAO.updateBean(admin);
        } else {
            response.getWriter().print("<script language=javascript>alert('重置失败');window.location.href='manage/index.jsp';</script>");
            return;
        }
        response.getWriter().print("<script language=javascript>alert('重置成功');window.location.href='manage/index.jsp';</script>");
    }
    public String announcementManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where title like '%" + keyWord + "%' or content like '%" + keyWord + "%' or id = '" + keyWord
                    + "'");
            request.setAttribute("username", keyWord);
        }
        sb.append(" order by id desc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = announcementDAO.selectBeanCount("");
        request.setAttribute("list", announcementDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage,
                "../adminMethod!announcementManage", "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!announcementManage");
        request.setAttribute("urlUpdate", "adminMethod!announcementUpdate");
        request.setAttribute("urlRemove", "adminMethod!announcementRemove");
        request.setAttribute("title", "公告管理");
        this.setUrl("manage/notice.jsp");
        return SUCCESS;
    }

    public void announcementCreate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String start = request.getParameter("start").replace("T","");
        String end = request.getParameter("end").replace("T","");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddHH:mm");
        Date time_start = sdf.parse(start);
        Date time_end = sdf.parse(end);
        Date date = new Date();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html; charset=gbk");
        int compare = time_end.compareTo(time_start);
        int compare2 = time_start.compareTo(date);
        if (compare== 1 && compare2 == 1&& null != title && null != content && !title.isEmpty() && !content.isEmpty() ) {
            Announcement announcement = new Announcement();
            announcement.setTitle(title);
            announcement.setContent(content);
            announcement.setCreatetime(date);
            announcement.setStart_time(time_start);
            announcement.setEnd_time(time_end);
            announcement.setStatus(0);
            announcementDAO.insertBean(announcement);

            response.getWriter().print("<script language=javascript>alert('添加成功');window.location.href='index.jsp';" +
                    "</script>");
        }else if(compare2 != 1){
            response.getWriter().print("<script language=javascript>alert('添加失败,开始日期不能小于或等于当前日期');window.location.href='index.jsp';" +
                    "</script>");
        }
        else if(compare != 1){
            response.getWriter().print("<script language=javascript>alert('添加失败,结束日期不能小于或等于开始日期');window.location.href='index.jsp';" +
                    "</script>");
        }else {
            response.getWriter().print("<script language=javascript>alert('添加失败，数据不能为空');window.location.href='index.jsp';" +
                    "</script>");
        }
    }

    public void announcementRemove() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {

        }
        Announcement announcement = announcementDAO.selectBean("where id =" + id);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (announcement == null) {
            response.getWriter().print("<script language=javascript>alert('删除失败');window.location.href='index.jsp';" +
                    "</script>");
        }
        announcementDAO.deleteBean(announcement);
        response.getWriter().print("<script language=javascript>alert('删除成功');window.location.href='index.jsp';" +
                "</script>");
    }

    public void announcementUpdate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        String id = request.getParameter("id");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddHH:mm");
        Date start = sdf.parse(request.getParameter("start"));
        Date end = sdf.parse(request.getParameter("end"));
        Date date = new Date();
        int compare = end.compareTo(start);
        int compare2 = start.compareTo(date);
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        Announcement announcement = announcementDAO.selectBean("where id=" + id);
        if (compare == 1 && compare2 == 1){
            announcement.setTitle(request.getParameter("title"));
            announcement.setContent(request.getParameter("content"));
            announcement.setStart_time(start);
            announcement.setEnd_time(end);
            announcement.setStatus(request.getParameter("status") == "1" ? 1 : 0);
            announcementDAO.updateBean(announcement);
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
        }else if(compare2 != 1){
            response.getWriter().print("<script language=javascript>alert('添加失败,开始日期不能小于或等于当前日期');window.location.href='index.jsp';" +
                    "</script>");
        }else if(compare == 1){
            response.getWriter().print("<script language=javascript>alert('添加失败,结束日期不能小于或等于开始日期');window.location.href='index.jsp';" +
                    "</script>");
        }
        response.getWriter().print("<script language=javascript>alert('编辑成功');window.location.href='index.jsp';" +
                "</script>");
    }

    public String stationManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where name like '%" + keyWord + "%' or id='" + keyWord + "' or locationDetail like '%" + keyWord + "%'");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append(" order by id desc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = stationDAO.selectBeanCount("");
        request.setAttribute("list", stationDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage,
                "../adminMethod!stationManage", "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!stationManage");
        request.setAttribute("urlUpdate", "../adminMethod!stationUpdate");
        request.setAttribute("urlRemove", "../adminMethod!stationRemove");
        request.setAttribute("title", "站点管理");
        this.setUrl("manage/stationmanage.jsp");
        return SUCCESS;
    }

    public void stationCreate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        Station station = new Station();
        station.setName(request.getParameter("name"));
        station.setLocationBrief(request.getParameter("locationBrief"));
        station.setLocationDetail(request.getParameter("locationDetail"));
        station.setPhone(request.getParameter("phone"));

        int check = stationDAO.selectBeanCount(" where name = '" + station.getName() + "'");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (0 != check) {
            response.getWriter().print("<script language=javascript>alert('创建失败,站点名已存在');window.location.href='manage/index" +
                    ".jsp';</script>");
            return;
        }
        stationDAO.insertBean(station);
        response.getWriter().print("<script language=javascript>alert('创建成功');window.location.href='manage/index.jsp';" +
                "</script>");
    }

    public void stationRemove() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        Station station = stationDAO.selectBean("where id=" + id);
        if (null == station) {
            response.getWriter().print("<script language=javascript>alert('站点不存在');window.location" +
                    ".href='javascript:history.back(-1);';</script>");
            return;
        }
        int check = routeDAO.selectBeanCount("where leavestation = '"+station.getId()+"' or  arrivestation = '"+station.getId()+"'");
        if (check != 0){
            response.getWriter().print("<script language=javascript>alert('该站点有对应线路, 不能删除');window.location" +
                    ".href='manage/index.jsp';</script>");
            return;
        }
        stationDAO.deleteBean(station);
        response.getWriter().print("<script language=javascript>alert('删除成功');window.location" +
                ".href='javascript:history.back(-1);';</script>");
    }

    public void stationUpdate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        String id = request.getParameter("id");
        Station station_check = stationDAO.selectBean("where id=" + id);
        String check_name = station_check.getName();
        Station station = stationDAO.selectBean("where id=" + id);
        String name = request.getParameter("name");
        station.setName(name);
        station.setLocationBrief(request.getParameter("locationBrief"));
        station.setLocationDetail(request.getParameter("locationDetail"));
        station.setPhone(request.getParameter("phone"));
        int check = stationDAO.selectBeanCount(" where name = '" + station.getName() + "'");
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (0 != check && !name.equals(check_name) ) {
            response.getWriter().print("<script language=javascript>alert('修改失败,站点名已存在');window.location.href='manage/index" +
                    ".jsp';</script>");
            return;
        }
        stationDAO.updateBean(station);
        response.getWriter().print("<script language=javascript>alert('编辑成功');window.location" +
                ".href='manage/index.jsp';</script>");

    }

    public String wordManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where status like '%" + keyWord + "%' or id = '" + keyWord + "'");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append(" order by id asc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = wordDAO.selectBeanCount("");
        request.setAttribute("list", wordDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage,
                "../adminMethod!wordManage", "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!wordManage");
        request.setAttribute("urlUpdate", "../adminMethod!wordUpdate");
        request.setAttribute("urlRemove", "../adminMethod!wordRemove");
        request.setAttribute("title", "在线咨询");
        this.setUrl("manage/onlineconsult.jsp");
        return SUCCESS;
    }

    //回复留言
    public void wordUpdate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        String id = request.getParameter("id");
        Word word = wordDAO.selectBean("where id=" + id);
        word.setReply_content(request.getParameter("reply_content"));
        word.setReply_time(new Date());
        word.setStatus("已回复");
        wordDAO.updateBean(word);
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        response.getWriter().print("<script language=javascript>alert('回复成功');window.location.href='manage/index.jsp';</script>");
    }

    //查看留言
    public String wordShow() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        String id = request.getParameter("id");
        Word word = wordDAO.selectBean("where id=" + id);
        word.setStatus("已查看");
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        wordDAO.insertBean(word);
        return SUCCESS;
    }

    public String busManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where plateNumber like '%" + keyWord + "%' or id = '" + keyWord + "'");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append(" order by id desc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = busDAO.selectBeanCount("");
        request.setAttribute("list", busDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage, "../adminMethod!busManage",
                "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!busManage");
        request.setAttribute("urlUpdate", "../adminMethod!busUpdate");
        request.setAttribute("urlRemove", "../adminMethod!busRemove");
        request.setAttribute("title", "车辆管理");
        List<BusType> busTypes = busTypeDAO.selectBeanList(0,999,"");
        request.setAttribute("busTypeList", busTypes);
        this.setUrl("manage/busmanagement.jsp");
        return SUCCESS;
    }

    public void busCreate() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        Bus bus = new Bus();
        bus.setPlateNumber(request.getParameter("plateNumber"));
        bus.setTotalSeats(Integer.parseInt(request.getParameter("totalSeats").trim()));
        bus.setDescription(request.getParameter("description"));
        String busTypeName = request.getParameter("busTypeName");
        BusType busType = busTypeDAO.selectBean(" where name='"+busTypeName+"'");
        if(busType == null){
            response.getWriter().print("<script language=javascript>alert('创建失败,该类型不存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return;
        }
        bus.setBusType(busType);

        int check = busDAO.selectBeanCount(" where plateNumber='" + bus.getPlateNumber() + "'");
        if (check != 0) {
            response.getWriter().print("<script language=javascript>alert('添加失败,该车辆已存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return;
        }else{
            busDAO.insertBean(bus);
            response.getWriter().print("<script language=javascript>alert('添加成功');window.location" +
                    ".href='index.jsp';</script>");
        }
    }

    public void busRemove() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        String id=request.getParameter("id");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
        Bus bus= busDAO.selectBean("where id="+id);
        if(null == bus){
            response.getWriter().print("<script language=javascript>alert('车辆不存在');window.location.href='javascript:history.back(-1);';</script>");
            return;
        }
        int check = scheduleDAO.selectBeanCount("where bus.id ="+bus.getId());
        if(check!=0){
            response.getWriter().print("<script language=javascript>alert('该车辆有对应班次, 不能删除');window.location.href='manage/index.jsp';" +
                    "</script>");
            return;
        }
        busDAO.deleteBean(bus);
        response.getWriter().print("<script language=javascript>alert('删除成功');window.location.href='javascript:history.back(-1);';</script>");
    }

    public void busUpdate() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        String id =request.getParameter("id");
        Bus bus_check = busDAO.selectBean("where id = " + id);
        String check_plateNumber = bus_check.getPlateNumber();
        Bus bus = busDAO.selectBean("where id = " + id);
        String plateNumber = request.getParameter("plateNumber");
        bus.setPlateNumber(plateNumber);
        bus.setTotalSeats(Integer.parseInt(request.getParameter("totalSeats").trim()));
        bus.setDescription(request.getParameter("description"));
        String busTypeName = request.getParameter("busTypeName");
        BusType busType = busTypeDAO.selectBean(" where name='"+busTypeName+"'");
        if(busType == null){
            response.getWriter().print("<script language=javascript>alert('创建失败,该类型不存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return ;
        }
        int check = busDAO.selectBeanCount(" where plateNumber='" + bus.getPlateNumber() + "'");
        if (check != 0 && !plateNumber.equals(check_plateNumber)) {
            response.getWriter().print("<script language=javascript>alert('修改失败,该车辆已存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return ;
        }
        busDAO.updateBean(bus);
        response.getWriter().print("<script language=javascript>alert('编辑成功');window.location.href='manage/index.jsp';</script>");

    }

    public String busTypeManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where id like '%" + keyWord + "%' or name like '%" + keyWord + "%'");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append("order by id desc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = busTypeDAO.selectBeanCount("");
        request.setAttribute("list", busTypeDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage,
                "../adminMethod!busTypeManage", "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!busTypeManage");
        request.setAttribute("urlUpdate", "../adminMethod!busTypeUpdate");
        request.setAttribute("urlRemove", "../adminMethod!busTypeRemove");
        request.setAttribute("title", "类型管理");
        this.setUrl("manage/bustype.jsp");
        return SUCCESS;
    }

    public void busTypeCreate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        BusType busType = new BusType();
        busType.setName(request.getParameter("name"));
        busType.setDescription(request.getParameter("description"));

        int check = stationDAO.selectBeanCount(" where name = '" + busType.getName() + "'");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (0 != check) {
            response.getWriter().print("<script language=javascript>alert('创建失败,该类型已存在');window.location" +
                    ".href='index.jsp';</script>");
            return;
        }
        busTypeDAO.insertBean(busType);
        response.getWriter().print("<script language=javascript>alert('创建成功');window.location" +
                ".href='index.jsp;';</script>");
    }

    public void busTypeRemove() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        BusType busType = busTypeDAO.selectBean("where id=" + id);
        if (null == busType) {
            response.getWriter().print("<script language=javascript>alert('类型不存在');window.location" +
                    ".href='javascript:history.back(-1);';</script>");
            return;
        }
        int check = busDAO.selectBeanCount("where bustype ="+busType.getId());
        if (check != 0){
            response.getWriter().print("<script language=javascript>alert('该类型有对应车辆, 不能删除');window.location" +
                    ".href='manage/index.jsp';</script>");
            return;
        }
        busTypeDAO.deleteBean(busType);
        response.getWriter().print("<script language=javascript>alert('删除成功');window.location" +
                ".href='manage/index.jsp';</script>");
    }

    public void busTypeUpdate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        String id = request.getParameter("id");
        BusType busType_check = busTypeDAO.selectBean("where id=" + id);
        String check_name = busType_check.getName();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (busType_check == null) {
            response.getWriter().print("<script language=javascript>alert('类型不存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return;
        }
        BusType busType = busTypeDAO.selectBean("where id =" +id);
        String name= request.getParameter("name");
        busType.setName(name);
        busType.setDescription(request.getParameter("description"));
        int check = busTypeDAO.selectBeanCount(" where name='" + busType.getName()+ "'");
        if (check != 0 && !name.equals(check_name)) {
            response.getWriter().print("<script language=javascript>alert('修改失败,类型已存在');window.location" +
                    ".href='manage/index.jsp';</script>");
            return ;
        }
        busTypeDAO.updateBean(busType);
        response.getWriter().print("<script language=javascript>alert('编辑成功');window.location" +
                ".href='manage/index.jsp';</script>");

    }

    public String orderManage() throws Exception {
        return SUCCESS;
    }

    public String routeManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where leaveStation.name like '%" + keyWord + "%' or arriveStation like '%" + keyWord + "%' or " +
                    "id='" + keyWord + "'");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append("order by id desc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = routeDAO.selectBeanCount("");
        request.setAttribute("list", routeDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage,
                "../adminMethod!routeManage", "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!routeManage");
        request.setAttribute("urlUpdate", "../adminMethod!routeUpdate");
        request.setAttribute("urlRemove", "../adminMethod!routeRemove");
        request.setAttribute("title", "线路管理");
        List<Station> stationlist1 = stationDAO.selectBeanList(0, 999, "where locationBrief like '%重庆%'");
        request.setAttribute("stationlist1", stationlist1);
        List<Station> stationlist = stationDAO.selectBeanList(0, 999, "");
        request.setAttribute("stationlist", stationlist);
        this.setUrl("manage/routemanage.jsp");
        return SUCCESS;
    }

    public void routeCreate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Route bean = new Route();
        String leaveStation = request.getParameter("leaveStation");
        String arriveStation = request.getParameter("arriveStation");
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        if (leaveStation.equals(arriveStation)){
            response.getWriter().print("<script language=javascript>alert('创建失败,始站和终站不能一致！');window.location.href='index" +
                    ".jsp';</script>");
            return;
        }
        bean.setLeaveStation(stationDAO.selectBean("where name='" + request.getParameter("leaveStation").trim() + "'"));
        bean.setArriveStation(stationDAO.selectBean("where name='" + request.getParameter("arriveStation").trim() +
                "'"));
        bean.setDistance(Integer.parseInt(request.getParameter("distance").trim()));

        int check = routeDAO.selectBeanCount(" where leaveStation.id = " + bean.getLeaveStation().getId() + " and " +
                "arriveStation.id=" + bean.getArriveStation().getId());
        if (0 != check) {
            response.getWriter().print("<script language=javascript>alert('创建失败,该路线已存在');window.location.href='index" +
                    ".jsp';</script>");
            return;
        }
        routeDAO.insertBean(bean);
        response.getWriter().print("<script language=javascript>alert('创建成功');window.location.href='index.jsp';" +
                "</script>");
    }

    public void routeRemove() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        Route bean = routeDAO.selectBean(" where id=" + id);
        if (null == bean) {
            response.getWriter().print("<script language=javascript>alert('路线不存在');window.location.href='manage/index.jsp';" +
                    "</script>");
            return;
        }
        int check = scheduleDAO.selectBeanCount("where route.id ="+bean.getId());
        if(check!=0){
            response.getWriter().print("<script language=javascript>alert('该路线有对应班次, 不能删除');window.location.href='manage/index.jsp';" +
                    "</script>");
            return;
        }

        routeDAO.deleteBean(bean);
        response.getWriter().print("<script language=javascript>alert('删除成功');window.location.href='manage/index.jsp';" +
                "</script>");
    }

    public String scheduleManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        sb.append("where status = 0");
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("and id = '" + keyWord + "'");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append(" order by id desc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = scheduleDAO.selectBeanCount("where status = 0");
        request.setAttribute("list", scheduleDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage,
                "../adminMethod!scheduleManage", "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!scheduleManage");
        request.setAttribute("urlUpdate", "../adminMethod!scheduleUpdate");
        request.setAttribute("urlRemove", "../adminMethod!scheduleRemove");
        request.setAttribute("title", "班次管理");

        List<Route> routes = routeDAO.selectBeanList(0,999,"");
        request.setAttribute("routeList", routes);
        List<Bus> buses = busDAO.selectBeanList(0,999,"");
        request.setAttribute("busList", buses);
        this.setUrl("manage/classes_common.jsp");
        return SUCCESS;
    }

    public void scheduleCreate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        Schedule schedule = new Schedule();
        Route route = routeDAO.selectBean("where id=" + request.getParameter("routeId"));
        Bus bus = busDAO.selectBean("where id=" + request.getParameter("busId"));
        schedule.setRoute(route);
        schedule.setBus(bus);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddHH:mm");
        String leave_time = request.getParameter("leaveTime").replace("T","");
        String arrive_time = request.getParameter("arriveTime").replace("T","");
        Date leaveTime = sdf.parse(leave_time);
        Date arriveTime = sdf.parse(arrive_time);
        Date date = new Date();
        schedule.setLeaveTime(leaveTime);
        schedule.setArriveTime(arriveTime);
        schedule.setStatus(0);
        schedule.setPrice(Double.parseDouble(request.getParameter("price").trim()));
        int compare = arriveTime.compareTo(leaveTime);
        Calendar now = Calendar.getInstance();
        now.add(Calendar.MINUTE, 60);
        Date curDateTime = now.getTime();
        int compare2 = leaveTime.compareTo(curDateTime);
        response.setContentType("text/html; charset=gbk");
        if(compare == 1 && compare2 == 1) {
         scheduleDAO.insertBean(schedule);
        }else if(compare2 != 1){
            response.getWriter().print("<script language=javascript>alert('添加失败,开始日期不能小于或等于当前日期一个小时以内');window.location.href='index.jsp';" +
                    "</script>");
            return;
        }
        else if(compare != 1){
            response.getWriter().print("<script language=javascript>alert('添加失败,结束日期不能小于或等于开始日期');window.location.href='index.jsp';" +
                    "</script>");
            return;
        }
        int num = schedule.getBus().getTotalSeats();
        List<Ticket> tickets = new ArrayList<>();
        for (int i = 1; i <= num; ++i) {
            Ticket ticket = new Ticket();
            ticket.setSchedule(schedule);
            ticket.setSeatNumber(i);
            ticket.setStatus(0);
            ticketDAO.insertBean(ticket);
            tickets.add(ticket);
        }
        schedule.setTickets(tickets);
        scheduleDAO.updateBean(schedule);
        response.setContentType("text/html; charset=gbk");
        response.getWriter().print("<script language=javascript>alert('添加成功');window.location.href='index.jsp';" +
                "</script>");
    }

    public void scheduleRemove() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        Schedule schedule = scheduleDAO.selectBean("where id=" + id);
        if (null == schedule) {
            response.getWriter().print("<script language=javascript>alert('班次不存在');window.location.href='manage/index.jsp';" +
                    "</script>");
            return;
        }
        schedule.setStatus(1);
        scheduleDAO.updateBean(schedule);
        response.getWriter().print("<script language=javascript>alert('删除成功');window.location.href='manage/index.jsp';" +
                "</script>");
    }

    public String ticketManage() throws Exception {
        return SUCCESS;
    }

    public String userManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where id='" + keyWord + "' or name like '%" + keyWord + "%'");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append("order by id desc ");
        String where = sb.toString();
        int currentpage = 1;
        int pagesize = 10;
        if (request.getParameter("pagenum") != null) {
            currentpage = Integer.parseInt(request.getParameter("pagenum"));
        }
        int total = userDAO.selectBeanCount("");
        request.setAttribute("list", userDAO.selectBeanList((currentpage - 1) * pagesize, pagesize, where));
        request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize, currentpage,
                "../adminMethod!userManage", "共有" + total + "条记录"));
        request.setAttribute("url", "../adminMethod!userManage");
        request.setAttribute("urlSetLock", "../adminMethod!userSetLock");
        request.setAttribute("urlReleaseLock", "../adminMethod!userReleaseLock");
        request.setAttribute("title", "用户管理");
        this.setUrl("manage/alluser.jsp");
        return SUCCESS;
    }

    public void userSetLock() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        User user = userDAO.selectBean("where id = " + id);
        HttpServletResponse response = ServletActionContext.getResponse();
        if (user.getStatus() == 1) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('该用户已停用！修改失败');window.location.href='manage/index.jsp';doclk('adminMethod!userManage');</script>");
            return;
        } else if (user != null) {
            user.setStatus(1);
            userDAO.updateBean(user);
        }
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        response.getWriter().print("<script language=javascript>alert('修改成功');window.location.href='manage/index.jsp'doclk('adminMethod!userManage');;" +
                "</script>");
    }

    public void userReleaseLock() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        User user = userDAO.selectBean("where id = " + id);
        HttpServletResponse response = ServletActionContext.getResponse();
        if (user.getStatus() == 0) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('该用户已启用！修改失败');window.location.href='manage/index.jsp';doclk('adminMethod!userManage');</script>");
            return;
        } else if (user != null) {
            user.setStatus(0);
            userDAO.updateBean(user);
        }

        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        response.getWriter().print("<script language=javascript>alert('修改成功');window.location.href='manage/index.jsp';</script>");
    }

    public StationDAO getStationDAO() {
        return stationDAO;
    }

    public void setStationDAO(StationDAO stationDAO) {
        this.stationDAO = stationDAO;
    }
}
