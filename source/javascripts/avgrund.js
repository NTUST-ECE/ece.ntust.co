/*!
 * avgrund 0.1
 * http://lab.hakim.se/avgrund
 * MIT licensed
 *
 * Copyright (C) 2012 Hakim El Hattab, http://hakim.se
 */
var Avgrund = (function(){

	var container = document.documentElement,
		popup = document.querySelector( '.avgrund-popup-animate' ),
		cover = document.querySelector( '.avgrund-cover' ),
		currentState = null;
	var textArray = [ '只要有心人人都可以是食神<br>ps.幹架別忘了好折凳。','實歲是從媽媽的身體裡出來開始算的，虛歲是從爸爸的身體裡出來開始算的','宅：我的主機板會喵喵叫耶。<br>客服：喵喵叫？<br>宅：很長很長的喵阿，你學一次。<br>客服：喵～～<br>宅：喔喔喔 太爽了，好萌阿。','我要在你屌上寫個慘字 忄...寫不下了','曹孟德有一私子，名不詳，字爽德<br>性喜武，精各式武藝，又以尖刀為最擅<br>其使尖刀時，然舞之速奇快，不見刀體，只得刀聲，如百把尖刀呼嘯而過。<br>後人稱之為「曹爽德，尖刀一百快」','甘寧有一母，名不詳，字不詳<br>其母性喜武，精各式武藝，又以一陽指最擅<br>其使手指時，手勁強韌，指力非凡，不見手體，更無指影<br>緊握五指，便能摜殺猛獸、直搗銅牆。<br>後人稱之為「甘寧娘，握指能打獸牆」','女生胸部越小，脾氣越差？<br>是謂--有容奶大 窮胸惡極','輕輕敲醒沉睡的心靈 慢慢張開你的眼睛<br>看那忙碌的西屏是否依然 和寶傑講個不停<br>澔平不解風情 全都推給外星		--<明天會更好>','最後的疼愛<br>是腳打開<br>不要一張雙人床中間隔著柯賜海		--李聖傑<手放開>','晨過市，忽覺甘酸撲鼻，見一販桃李者，往問之，"桃李何者良?"<br>"桃味酸香，李味甘甜，各有滋味，皆為良品，意欲為何?"<br>"如此，則甘李良。"<br>語畢，販者暴起相毆，其也怪耶歟?	--<老殘遊記>','復向東，見一商港，然商販皆金髮碧眼，料是海外來朝之英吉利商販集散所在，舶來異寶眾多，正目眩神迷間，琴聲價響，佇聽之，或如山壑雅秀，或如水潭淨謐，時悠遠輕揚，復而厚實凝重，令人神馳，急尋琴聲來處，見一英吉利女子正自奏藝販琴，當下文思泉湧，兼有結識之意，於是突出人群，吟詩唱和:"商娥扶碧曲，秀謐悠而厚..."，詩未竟，曲驟斷，但見英女神色驚訝，連聲曰諾，正暗喜間，卻見數名英商巡官怒目而來，倒拖吾身，飽以老拳。嗟乎，奈何蠻夷終究不識詩詞曲賦之美...。		--<老殘遊記>'];
	var randomNumber = Math.floor(Math.random()*textArray.length);
	container.className = container.className.replace( /\s+$/gi, '' ) + ' avgrund-ready';

	// Deactivate on ESC
	function onDocumentKeyUp( event ) {
		if( event.keyCode === 27 ) {
			deactivate();
		}
	}

	// Deactivate on click outside
	function onDocumentClick( event ) {
		if( event.target === cover ) {
			deactivate();
		}
	}

	function activate( state ) {
		document.addEventListener( 'keyup', onDocumentKeyUp, false );
		document.addEventListener( 'click', onDocumentClick, false );
		document.addEventListener( 'touchstart', onDocumentClick, false );

		removeClass( popup, currentState );
		addClass( popup, 'no-transition' );
		addClass( popup, state );

		setTimeout( function() {
			removeClass( popup, 'no-transition' );
			addClass( container, 'avgrund-active' );
		}, 0 );

		currentState = state;
	}

	function deactivate() {
		document.removeEventListener( 'keyup', onDocumentKeyUp, false );
		document.removeEventListener( 'click', onDocumentClick, false );
		document.removeEventListener( 'touchstart', onDocumentClick, false );

		removeClass( container, 'avgrund-active' );
		removeClass( popup, 'avgrund-popup-animate')
	}

	function disableBlur() {
		addClass( document.documentElement, 'no-blur' );
	}

	function addClass( element, name ) {
		element.className = element.className.replace( /\s+$/gi, '' ) + ' ' + name;
	}

	function removeClass( element, name ) {
		element.className = element.className.replace( name, '' );
	}

	function show(selector){
		document.getElementById("p1").innerHTML = textArray[randomNumber]; 
		popup = document.querySelector( selector );
		addClass(popup, 'avgrund-popup-animate');
		activate();
		return this;
	}
	function hide() {
		deactivate();
	}

	return {
		activate: activate,
		deactivate: deactivate,
		disableBlur: disableBlur,
		show: show,
		hide: hide
	}

})();
