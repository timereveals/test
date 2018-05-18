package dingpiao.action;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dingpiao.dao.*;
import dingpiao.model.*;
import dingpiao.util.Arith;
import org.apache.commons.collections.map.HashedMap;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import dingpiao.dao.RouteDAO;

public class UserAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private AnnouncementDAO announcementDAO;

    private OrderDAO orderDAO;

    private RouteDAO routeDAO;

    private ScheduleDAO scheduleDAO;

    private TicketDAO ticketDAO;

    private UserDAO userDAO;

    private BusDAO busDAO;

    private BusTypeDAO busTypeDAO;

    private PassengerDAO passengerDAO;

    private StationDAO stationDAO;

    private WordDAO wordDAO;

    private String url = "./";

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

    public WordDAO getWordDAO() {
        return wordDAO;
    }

    public void setWordDAO(WordDAO wordDAO) {
        this.wordDAO = wordDAO;
    }

    public PassengerDAO getPassengerDAO() {
        return passengerDAO;
    }

    public void setPassengerDAO(PassengerDAO passengerDAO) {
        this.passengerDAO = passengerDAO;
    }

    public StationDAO getStationDAO() {
        return stationDAO;
    }

    public void setStationDAO(StationDAO stationDAO) {
        this.stationDAO = stationDAO;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String index() throws Exception {
        return SUCCESS;
    }

    //注册
    public void register() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        User user = new User();
        user.setName(request.getParameter("name"));
        user.setPassword(request.getParameter("password"));
        user.setRealName(request.getParameter("realName"));
        user.setIDNumber(request.getParameter("IDNumber"));
        user.setPhone(request.getParameter("phone"));
        user.setEmail(request.getParameter("email"));
        user.setCreatetime(new Date());
        user.setStatus(0);

        User user_check = userDAO.selectBean("where name = '" + user.getName() + "'");
        if (null == user_check) {
            userDAO.insertBean(user);
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('注册成功，您的用户名是" + user.getName() + ",请妥善保管');" +
                    "window.location.href='login.jsp';</script>");
        } else {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('注册失败！该用户名已经存在！');window.location" +
                    ".href='register.jsp';</script>");
        }
    }

    //登录
    public void login() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        User user = userDAO.selectBean("where name='" + name + "' and password='" + password + "'");
        if (user == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('用户名或密码错误！');window.location.href='login" +
                    ".jsp';</script>");
        } else if (user.getStatus() == 1) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('该用户已被停用！');window.location.href='login" +
                    ".jsp';</script>");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>window.location.href='./';</script>");
        }
    }

    //登出
    public String logout() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        this.setUrl("login.jsp");
        return SUCCESS;
    }

    //忘记密码
    public void forgetpwd() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        User user = new User();
        user.setName(request.getParameter("name"));
        user.setPhone(request.getParameter("phone"));
        user.setPassword(request.getParameter("password"));
        user.setRealName(request.getParameter("realName"));
        user.setStatus(0);
        User user_check = userDAO.selectBean("where name = '" + user.getName() + "'and phone='" + user.getPhone() +
                "'and realName='" + user.getRealName() + "'");
        if (user_check == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('用户名、手机号、真实姓名不匹配，请重新输入！');window.location" +
                    ".href='forgetpwd.jsp';</script>");
        } else {
            user_check.setPassword(user.getPassword());
            userDAO.insertBean(user_check);
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('您的密码是" + user.getPassword() + ",请妥善保管');" +
                    "window.location.href='login.jsp';</script>");
        }
    }

    public String tickets() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String leaveTime = request.getParameter("leaveTime");
        String arriveTime = request.getParameter("arriveTime");
        String vehicleType = request.getParameter("vehicleType");

        return SUCCESS;
    }

    public String announcement() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        Announcement announcement = announcementDAO.selectBean("where id = " + id);
        request.setAttribute("announcement", announcement);
        this.setUrl("announcement.jsp");
        return SUCCESS;
    }

    public String schedule() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();

        List<Route> routes = routeDAO.selectBeanList(0, 999, "");
        List<String> leaveStations = new ArrayList<>();
        List<String> arriveStations = new ArrayList<>();
        for (Route route : routes) {
            leaveStations.add(route.getLeaveStation().getName());
            arriveStations.add(route.getArriveStation().getName());
        }
        request.setAttribute("leaveStations", leaveStations);
        request.setAttribute("arriveStations", arriveStations);

        List<BusType> busTypes = busTypeDAO.selectBeanList(0, 999, "");
        request.setAttribute("busTypeList", busTypes);

        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String busType = request.getParameter("busType");

        String where = " where ";

        String dateFormat = "yyyy-MM-dd";
        String timeFormat = "HH:mm:ss";
        String dateTimeFormat = dateFormat + " " + timeFormat;

        Date currentTime = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(dateTimeFormat);
        String strCurrentTime = sdf.format(currentTime);
        where += " date_format(leaveTime, '%Y-%m-%d %T') > '" + strCurrentTime + "' ";

        if (date != null && !date.isEmpty()) {
            where += "and date_format(leaveTime, '%Y-%m-%d') = '" + date + "'";
            request.setAttribute("date", date);
        }

        if (time != null && !time.isEmpty()) {
            where += " and ";
            String leaveTime = "date_format(leaveTime,'%T')";
            switch (time) {
                case "12":
                    where += leaveTime + " >= '00:00:00' and " + leaveTime + " < " + "'12:00:00' ";
                    break;
                case "18":
                    where += leaveTime + " >= '12:00:00' and " + leaveTime + " < " + "'18:00:00' ";
                    break;
                case "24":
                    where += leaveTime + " >= '18:00:00' and " + leaveTime + " < " + "'24:00:00' ";
                    break;
                default:
                    break;
            }
            request.setAttribute("time", time);
        }

        if (null != from && !from.isEmpty()) {
            where += " and route.leaveStation.name like '%" + from + "%'";
            request.setAttribute("from", from);
        }

        if (null != to && !to.isEmpty()) {
            where += " and route.arriveStation.name = '" + to + "'";
            request.setAttribute("to", to);
        }

        if (null != busType && !busType.isEmpty()) {
            where += " and bus.busType.name like '%" + to + "%'";
            request.setAttribute("busType", busType);
        }

        where += " and status = 0 order by leaveTime asc";

        Date curDate = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-ddHH:mm");
        String curTime = simpleDateFormat.format(curDate);
        List<Announcement> announcements = announcementDAO.selectBeanList(0, 999, " where date_format(start_time,'%Y-%m-%d%T') < '"+curTime+"' and date_format(end_time,'%Y-%m-%d%T') > '" + curTime+"'");
        request.setAttribute("announcements", announcements);

        checkTicketStatus();

        List<Schedule> scheduleList = scheduleDAO.selectBeanList(0, 999, where);
        for (int i = 0; i < scheduleList.size(); ++i) {
            if (scheduleList.get(i).getTickets().size() <= 0 || allTicketSold(scheduleList.get(i).getTickets())) {
                scheduleList.remove(i);
            }
        }

        request.setAttribute("scheduleList", scheduleList);

        this.setUrl("busticket.jsp");
        return SUCCESS;
    }

    private boolean allTicketSold(List<Ticket> tickets){
        for(Ticket ticket:tickets){
            if(ticket.getStatus() == 0){
                return false;
            }
        }
        return true;
    }

    private void checkTicketStatus(){
        Calendar now = Calendar.getInstance();
        now.add(Calendar.MINUTE, -15);
        Date curDateTime = now.getTime();
        List<Order> orders = orderDAO.selectBeanList(0,999," where status != 0");
        for(int i=0;i<orders.size();i++){
            if(orders.get(i).getCreatetime().getTime() < curDateTime.getTime()){
                orders.get(i).setStatus(0);
                for(Ticket ticket:orders.get(i).getTickets()){
                    ticket.setStatus(0);
                }
            }
        }
    }

    public String order() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';" +
                    "</script>");
            return null;
        }
        String scheduleid = request.getParameter("scheduleid");
        int iAvailable = ticketDAO.selectBeanCount("where status = 0 and schedule.id = " + scheduleid);
        if (0 == iAvailable) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('该班次票已售完！');window.location" +
                    ".href='userMethod!schedule';</script>");
            return null;
        }
        Schedule schedule = scheduleDAO.selectBean("where id =" + scheduleid);
        request.setAttribute("schedule", schedule);
        request.setAttribute("iAvailable", iAvailable);
        this.setUrl("addorder.jsp");
        return SUCCESS;
    }

    public String createOrder() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';" +
                    "</script>");
            return null;
        }

        String scheduleid = request.getParameter("scheduleid");
        String num = request.getParameter("num");
        Schedule schedule = scheduleDAO.selectBean("where id = '" + scheduleid + "'");

        if (null == num || num.isEmpty()) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('数量为0');window.location" +
                    ".href='userMethod!order?scheduleid=" + scheduleid + ";</script>");
            return null;
        }
        int orderNum = Integer.parseInt(num.trim());
        if (orderNum == 0 || orderNum > ticketDAO.selectBeanCount("where schedule.id='" + scheduleid + "' and " +
                "status=0")) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('剩余票数量不足');window.location" +
                    ".href='userMethod!order?scheduleid=" + scheduleid + ";</script>");
            return null;
        }

        List<Passenger> passengers = new ArrayList<>();
        double totalPrice = 0;
        for (int i = 0; i < orderNum; i++) {
            Passenger passenger = new Passenger();
            passenger.setName(request.getParameter("name" + i));
            passenger.setIDNumber(request.getParameter("idCardNo" + i));
            passenger.setPhone(request.getParameter("telphone" + i));
            passenger.setHalfPrice(request.getParameter("ticketType") == "1" ? 1 : 0);
            if (passenger.getHalfPrice() == 1) {
                totalPrice += schedule.getPrice() / 2;
            } else {
                totalPrice += schedule.getPrice();
            }
            passenger.setInsurance(request.getParameter("hasInsurance") == "1" ? 1 : 0);
            if (passenger.getInsurance() == 1) {
                totalPrice += 2;
            }
            passenger.setWithChild(request.getParameter("hasChild") == "1" ? 1 : 0);
            passengerDAO.insertBean(passenger);
            passengers.add(passenger);
        }
        Order order = new Order();
        order.setCreatetime(new Date());
        order.setUser((User) session.getAttribute("user"));
        List<Ticket> tickets = ticketDAO.selectBeanList(0, orderNum, "where schedule.id=" + scheduleid + " and  " +
                "status = 0");
        for (Ticket ticket : tickets) {
            ticket.setStatus(2);
            ticketDAO.updateBean(ticket);
        }

        order.setPassenger(passengers);
        order.setTickets(tickets);
        order.setTotalPrice(totalPrice);
        order.setStatus(2);
        orderDAO.insertBean(order);

        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        response.getWriter().print("<script language='javascript'>alert('预定成功,请在我的订单中查看');</script>");

        request.setAttribute("order", order);
        request.setAttribute("user", user);
        request.setAttribute("schedule", schedule);
        this.setUrl("checkorder.jsp");
        return SUCCESS;
    }

    public void orderCancel() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html; charset=gbk");
        if(id!=null && !id.isEmpty()){
            Order order = orderDAO.selectBean("where id='"+id+"'");
            Calendar now = Calendar.getInstance();
            now.add(Calendar.MINUTE, 30);
            Date curDateTime = now.getTime();
            if(order.getStatus() == 0){
                response.getWriter().print("<script language=javascript>alert('取消失败, 订单已取消');window.location.href='index.jsp';" + "</script>");
                return;
            }
            if(curDateTime.getTime()>order.getTickets().get(0).getSchedule().getLeaveTime().getTime()){
                response.getWriter().print("<script language=javascript>alert('取消失败');window.location.href='index.jsp';" + "</script>");
                return;
            }

            order.setStatus(0);
            for(Ticket ticket:order.getTickets()){
                ticket.setStatus(0);
            }
            response.getWriter().print("<script language=javascript>alert('取消成功');window.location.href='index.jsp';" + "</script>");
            return;
        }
        response.getWriter().print("<script language=javascript>alert('取消失败');window.location.href='index.jsp';" + "</script>");
    }

    public String orderList() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';" +
                    "</script>");
            return null;
        }

        checkTicketStatus();

        List<Order> orders = orderDAO.selectBeanList(0, 999, "where user.id = '" + user.getId() + "'");

        request.setAttribute("orderlist", orders);
        this.setUrl("myorder.jsp");
        return SUCCESS;
    }

    public  String stationList() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where locationDetail like '%" + keyWord + "%' or name like '%" + keyWord + "%' ");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append(" order by id desc ");
        String where = sb.toString();
        List<Station> stationlist = stationDAO.selectBeanList(0,999,where);
        request.setAttribute("stationlist",stationlist);
        request.setAttribute("url","userMethod!stationList");
        this.setUrl("querystation.jsp");
        return SUCCESS;
    }


    public String orderInfo() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';" +
                    "</script>");
            return null;
        }

        String id = request.getParameter("id");
        if (null == id || id.isEmpty()) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('订单id为空');window.location.href='index.jsp';" +
                    "</script>");
            return null;
        }

        Order order = orderDAO.selectBean("where id = " + id);
        request.setAttribute("order", order);
        Schedule schedule = order.getTickets().get(0).getSchedule();
        request.setAttribute("schedule", schedule);
        request.setAttribute("user", user);
        this.setUrl("checkorder.jsp");
        return SUCCESS;
    }

    //个人中心
    //修改个人信息
    public String alteruserinfo() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';" +
                    "</script>");
            return null;
        }
        User user_check = userDAO.selectBean("where id='" + user.getId() + "'");
        user_check.setName(request.getParameter("name"));
        user_check.setRealName(request.getParameter("realName"));
        user_check.setPhone(request.getParameter("phone"));
        user_check.setIDNumber(request.getParameter("IDNumber"));
        user_check.setEmail(request.getParameter("email"));
        user_check.setSex(request.getParameter("sex"));
        userDAO.updateBean(user_check);
        response.setCharacterEncoding("gbk");
        response.setContentType("text/html; charset=gbk");
        response.getWriter().print("<script language=javascript>alert('修改成功！');window.location.href='personal.jsp';" +
                "</script>");
        return SUCCESS;
    }

    //修改密码
    public void alterpwd() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();

        String pwd1 = request.getParameter("password1");
        String pwd2 = request.getParameter("password2");
        User logedInUser = (User) session.getAttribute("user");
        if (logedInUser == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';" +
                    "</script>");
            return;
        }
        String name = logedInUser.getName();
        User user = userDAO.selectBean("where name = '" + name + "' and password = '" + pwd1 + "'");
        if (user != null) {
            user.setPassword(pwd2);
            userDAO.updateBean(user);
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('修改成功，请重新登录！');window.location.href='login" +
                    ".jsp';</script>");
        } else {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('用户名或者密码错误');window.location.href='personal" +
                    ".jsp';</script>");
        }
    }

    //留言
    public String word() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html; charset=gbk");
        HttpSession session = request.getSession();
        Word word = new Word();
        User user = (User) session.getAttribute("user");
        word.setUser(user);
        word.setWord_content(request.getParameter("wordContent"));
        word.setWord_time(new Date());
        word.setStatus("未读");

        wordDAO.insertBean(word);
        response.getWriter().print("<script language=javascript>alert('留言成功！');window.location.href='personal.jsp';" +
                "</script>");
        this.setUrl("personal.jsp");
        return SUCCESS;
    }

    //查看留言
    public String wordList() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        String list = (String) session.getAttribute("list");
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';" +
                    "</script>");
            return null;
        }
        String keyWord = request.getParameter("keyWord");
        StringBuffer sb = new StringBuffer();
        if (keyWord != null && !"".equals(keyWord)) {
            sb.append("where  user.id = '" + user.getId() + "'and status like '%" + keyWord + "%' ");
            request.setAttribute("keyWord", keyWord);
        }
        sb.append(" order by word_time desc ");
        String where = sb.toString();
        List<Word> wordList = wordDAO.selectBeanList(0, 999, where);
        request.setAttribute("wordList", wordList);
        request.setAttribute("url","userMethod!wordList");
        this.setUrl("message.jsp");
        return SUCCESS;
    }

    //乘车人管理
    public String passengerManage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user==null){
            response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';</script>");
            return null;
        }
        List<Passenger> passengerList = passengerDAO.selectBeanList(0,999,"where user.id = '" + user.getId() +"'");
        request.setAttribute("passengerList",passengerList);
        request.setAttribute("url","userMethod!passengerManage");
        request.setAttribute("urlCreate","userMethod!passengerCreate");
        request.setAttribute("urlRemove","userMethod!passengerRemove");
        this.setUrl("passenger.jsp");
        return  SUCCESS;
    }

    public void passengerCreate() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('请先登录！');window.location.href='login.jsp';</script>");
        }
        Passenger passenger = new Passenger();
        passenger.setUser(user);
        passenger.setName(request.getParameter("name"));
        passenger.setPhone(request.getParameter("phone"));
        passenger.setIDNumber(request.getParameter("IDNumber"));

        Passenger passenger_check = passengerDAO.selectBean("where name='" + passenger.getName() + "'and user.id='" + user.getId() + "'");
        if (passenger_check != null) {
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('已存在该乘车人！');window.location.href='personal.jsp';</script>");
        } else {
            passengerDAO.insertBean(passenger);
            response.setCharacterEncoding("gbk");
            response.setContentType("text/html; charset=gbk");
            response.getWriter().print("<script language=javascript>alert('添加乘车人成功！');window.location.href='personal.jsp';</script>");
        }
    }
    public void passengerRemove() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        String id=request.getParameter("id");
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
        Passenger bean= passengerDAO.selectBean("where id="+id);
        if(null == bean){
            response.getWriter().print("<script language=javascript>alert('该乘车人不存在');window.location.href='personal.jsp';</script>");
            return;
        }
        passengerDAO.deleteBean(bean);
        response.getWriter().print("<script language=javascript>alert('删除成功');window.location.href='personal.jsp';</script>");

    }
    //热门路线,
    public String hotRoad() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        List<Schedule> scheduleList = scheduleDAO.selectBeanList(0,999,"");
        Map<String,Object> map;
        List<Map<String,Object>> schedules=new ArrayList<>();
        int scheduleId;
        for (Schedule schedule:scheduleList) {
            map=new HashMap<>();
            scheduleId=schedule.getId();
            int ticketCount = ticketDAO.selectBeanCount("where status = 1 and schedule.id= '"+scheduleId+"'");
            map.put("scheduleId",scheduleId);
            map.put("ticketCount",ticketCount);
            map.put("leavestationName",schedule.getRoute().getLeaveStation().getName());
            map.put("arrivestationName",schedule.getRoute().getArriveStation().getName());
            schedules.add(map);
        }
        Collections.sort(schedules, new Comparator<Map<String, Object>>() {
            @Override
            public int compare(Map<String, Object> o1, Map<String, Object> o2) {
                // TODO Auto-generated method stub
                String updateDate1 = o1.get("ticketCount").toString();
                String updateDate2 =  o2.get("ticketCount").toString();
                return updateDate2.compareTo(updateDate1);
            }
        });
        request.setAttribute("schedules",schedules);
        request.setAttribute("url","userMethod!hotRoad");
        this.setUrl("hotroad.jsp");
        return SUCCESS;
    }
}
