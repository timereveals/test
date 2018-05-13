//下拉搜索菜单
$(function(){

		var tag_data = [
			{id:1 ,name:'铜梁北站'},
			{id:2 ,name:'铜梁北站'},
			{id:3 ,name:'Detroit Pistons',desc:'底特律活塞'},
			{id:4 ,name:'Indiana Pacers',desc:'印第安纳步行者'},
			{id:5 ,name:'Milwaukee Bucks',desc:'密尔沃基雄鹿'},
			{id:6 ,name:'Brooklyn Nets',desc:'布鲁克林篮网'},
			{id:7 ,name:'Boston Celtics',desc:'波士顿凯尔特人'},
			{id:8 ,name:'New York Knicks',desc:'纽约尼克斯'},
			{id:9 ,name:'Philadelphia 76ers',desc:'费城76人'},
			{id:10,name:'Toronto Raptors',desc:'多伦多猛龙'},
			{id:11,name:'Atlanta Hawks',desc:'亚特兰大老鹰'},
			{id:12,name:'Charlotte Hornets',desc:'夏洛特黄蜂'},
			{id:13,name:'Miami Heat',desc:'迈阿密热火'},
			{id:14,name:'Orlando Magic',desc:'奥兰多魔术'},
			{id:15,name:'Washington Wizards',desc:'华盛顿奇才'},
			{id:16,name:'Denver Nuggets',desc:'丹佛掘金'},
			{id:17,name:'Minnesota Timberwolves',desc:'明尼苏达森林狼'},
		];
		$('#selectPage').selectPage({
			showField : 'name',
			keyField : 'id',
			autoFillResult : true,
			autoSelectFirst : true,
			data : tag_data
		});
	});