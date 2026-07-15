Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241BE2F7EE7
	for <linux-next@vger.kernel.org>; Wed, 15 Jul 2026 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096764; cv=none; b=O6KCnVNcg4b40EdeKTO9S1IZFXC/XB5koIbZrAzLlCJVkw/gmq+v6kVNUBeXYWmOiTT05aCVeOIrvoZnM+EMZKhucYzJkAWb8ast6G9FIL6HmY0NnqmMFdSGwxqtEtSTC1spnc9TxjeHr9Pxm/EylYo3YyuuB+z+4UGmgm9IbtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096764; c=relaxed/simple;
	bh=zYnADuB1omVVNFz9gr6KBNHrzpB/zuL9AsY/vK5ho+A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ShMZn6WTLYBN595rtxQ+++cYFMLGjEn2/u1/XR4/taNtgD9xI1ufbqwBbiFEqaPppWd0kctQ40zQGDVkEhUQfeLtp6SsDgBn7dVcHtEXHm9AkxT3OBMvUJFZAMPY3PnDU5nEyodR2pWBcxs1kPWeRm+Q+NQ1QG3oZZhBXplCkE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Q+GUrK9l; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Q+GUrK9l"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66F6PFfpC2663998, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784096715; bh=zYnADuB1omVVNFz9gr6KBNHrzpB/zuL9AsY/vK5ho+A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	b=Q+GUrK9lbZwHF/YkC9om6KzSTXeuFXCHDjV7/D2unKV0nbIn/jZG46jN7HhvMiBuh
	 5pgXkYJBRXlOYjRY/Q8c+7wAik2eWBAFehJ+6d6ARKGAHbCxyffZWKF7ATZP2cr2Rw
	 TLBPfvjwoiri9dJt6CR8rXqGQmiU7w3V8n4vILU6DHoaImmstPYj/Bnl0SuRWsQsju
	 5LxGcQOtlCRZ9QRwcv3/9lqJVU5ZNr4CXi/bihaDDu6jEUWYgRXc3WIdcZVkA8SgCY
	 F8QMHNlFaDXaf/hDdKsT1rLi4I2oKDOt8cNK0H+XizSOs2X6B38iVcVPVF3r/5Qdly
	 gGDnRkJGfJQcw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66F6PFfpC2663998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jul 2026 14:25:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 15 Jul 2026 14:25:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 15 Jul 2026 14:25:14 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "afaerber@suse.com"
	<afaerber@suse.com>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>
Subject: Add the Realtek SoC tree to linux-next
Thread-Topic: Add the Realtek SoC tree to linux-next
Thread-Index: Ad0UIgN2HRUL2/vgRv6ug1MnyYCpjw==
Date: Wed, 15 Jul 2026 06:25:14 +0000
Message-ID: <555485abc39a4ad1b252b4fd7c5bf706@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgTWFyaywNCg0KSSBhbSB0YWtpbmcgb3ZlciBhcyB0aGUgbWFpbnRhaW5lciBmb3IgQVJNL1JF
QUxURUsgQVJDSElURUNUVVJFLCB3aGlsZQ0KQW5kcmVhcyBGw6RyYmVyIG1vdmVzIHRvIGEgcmV2
aWV3ZXIgcm9sZS4NCg0KQ291bGQgeW91IHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0byBsaW51
eC1uZXh0Pw0KDQotIEdpdCByZXBvc2l0b3J5IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveXVfY2h1bi9saW51eC5naXQNCi0gQnJhbmNoOiBmb3It
bmV4dCAmIGZpeGVzDQoNCkJlc3QgUmVnYXJkcywNCll1IENodW4gTGluDQo=
