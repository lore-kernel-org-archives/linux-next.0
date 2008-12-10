From: "Zhang, Xiantao" <xiantao.zhang@intel.com>
Subject: RE: next-20081209: fail to build ia64/kvm
Date: Wed, 10 Dec 2008 12:53:44 +0800
Message-ID: <706158FABBBA044BAD4FE898A02E4BC219CAB8AB@pdsmsx503.ccr.corp.intel.com>
References: <a4423d670812090509q4d3dbe15h780ec3f4f11d1b3c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:16234 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751631AbYLJEx5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 23:53:57 -0500
In-Reply-To: <a4423d670812090509q4d3dbe15h780ec3f4f11d1b3c@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "kvm-ia64@vger.kernel.org" <kvm-ia64@vger.kernel.org>

Alex,
	Thanks!  I am cloning the linux-next tree and will send out a fix later. 
Xiantao

-----Original Message-----
From: Alexander Beregalov [mailto:a.beregalov@gmail.com] 
Sent: Tuesday, December 09, 2008 9:10 PM
To: linux-next@vger.kernel.org; anthony.xu@intel.com; Zhang, Xiantao; kvm-ia64@vger.kernel.org
Subject: next-20081209: fail to build ia64/kvm

arch/ia64/kvm/kvm-ia64.c: In function 'kvm_relocate_vmm':
arch/ia64/kvm/kvm-ia64.c:1547: error: dereferencing pointer to incomplete type
arch/ia64/kvm/kvm-ia64.c:1548: error: dereferencing pointer to incomplete type
