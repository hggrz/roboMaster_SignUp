//数据查看界面LayuiJS版块

layui.use(['laydate', 'layer', 'form', 'util', 'table', 'element', 'flow'], function() {
				var laydate = layui.laydate;
				var flow = layui.flow;
				var util = layui.util;
				var laypage = layui.laypage;
				var form = layui.form;
				//固定块
				util.fixbar({
					css: {
						right: 10,
						bottom: 50
					},
					bgcolor: '#393D49',
					click: function(type) {}
				});
				//日期范围
				laydate.render({
					elem: '#Valuation_growth_dateOption',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});

				laydate.render({
					elem: '#Car_model_analysis_dateOption',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				laydate.render({
					elem: '#FreightAnalysis_dateOption',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				laydate.render({
					elem: '#Transaction_growth_dateOption',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				//月份范围
				laydate.render({
					elem: '#Valuation_growth_monthOption',
					type: 'month',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				laydate.render({
					elem: '#Car_model_analysis_monthOption',
					type: 'month',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				
				laydate.render({
					elem: '#FreightAnalysis_monthOption',
					type: 'month',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				laydate.render({
					elem: '#Transaction_growth_monthOption',
					type: 'month',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				//年份范围
				laydate.render({
					elem: '#Valuation_growth_yearOption',
					type: 'year',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				laydate.render({
					elem: '#Car_model_analysis_yearOption',
					type: 'year',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});

				laydate.render({
					elem: '#FreightAnalysis_yearOption',
					type: 'year',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				laydate.render({
					elem: '#Transaction_growth_yearOption',
					type: 'year',
					range: true,
					range: '至',
					max: gitData(),
					min: '2015-1-1'
				});
				//车型分析阶段切换事件
				form.on('select(Car_model_analysis_SearchBox)', function(data) {
					show_hide(data.value,data.elem.name);
				})
				//运费分析阶段切换事件
				form.on('select(FreightAnalysis_data_SearchBox)', function(data) {
					show_hide(data.value,data.elem.name);
				})
				//估值分析阶段切换事件
				form.on('select(Valuation_growth_data_SearchBox)', function(data) {
					show_hide(data.value,data.elem.name);
				})
				//交易分析阶段切换事件
				form.on('select(Transaction_growth_data_SearchBox)', function(data) {
					show_hide(data.value,data.elem.name);
				})
				//切换查寻条件[天/月/年]
				function show_hide(value,$element_name) {
					var $Option_sel="."+$element_name+"Option_sel";
					var $dateOption="#"+$element_name+"dateOption";
					var $monthOption="#"+$element_name+"monthOption";
					var $yearOption="#"+$element_name+"yearOption";
					$($Option_sel).hide();
					switch(value) {
						case "1":
							$($dateOption).show();
							break;
						case "2":
							$($monthOption).show();
							break;
						case "3":
							$($yearOption).show();
							break;
						default:
							FriendlyPrompt("请选择查询类型");
					}
				}

				var $ = layui.jquery,
					element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

//				//触发事件
//				var active = {
//					tabAdd: function() {
//						//新增一个Tab项
//						element.tabAdd('demo', {
//							title: '新选项' + (Math.random() * 1000 | 0) //用于演示
//								,
//							content: '内容' + (Math.random() * 1000 | 0),
//							id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
//						})
//					},
//					tabDelete: function(othis) {
//						//删除指定Tab项
//						element.tabDelete('demo', '44'); //删除：“商品管理”
//
//						othis.addClass('layui-btn-disabled');
//					},
//					tabChange: function() {
//						//切换到指定Tab项
//						element.tabChange('demo', '22'); //切换到：用户管理
//					}
//				};

				$('.site-demo-active').on('click', function() {
					var othis = $(this),
						type = othis.data('type');
					active[type] ? active[type].call(this, othis) : '';
				});

				//Hash地址的定位
				var layid = location.hash.replace(/^#test=/, '');
				element.tabChange('test', layid);

				element.on('tab(test)', function(elem) {
					location.hash = 'test=' + $(this).attr('lay-id');
				});



				//按屏加载div元素
				flow.lazyimg({
					elem: '#Statistics div'
				});

				

			});