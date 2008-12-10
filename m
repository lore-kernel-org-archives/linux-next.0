From: "Zhang, Xiantao" <xiantao.zhang@intel.com>
Subject: RE: next-20081209: fail to build ia64/kvm
Date: Wed, 10 Dec 2008 16:48:39 +0800
Message-ID: <706158FABBBA044BAD4FE898A02E4BC219CABA93@pdsmsx503.ccr.corp.intel.com>
References: <a4423d670812090509q4d3dbe15h780ec3f4f11d1b3c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:43091 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754894AbYLJIsx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Dec 2008 03:48:53 -0500
In-Reply-To: <a4423d670812090509q4d3dbe15h780ec3f4f11d1b3c@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "anthony.xu@intel.com" <anthony.xu@intel.com>, "kvm-ia64@vger.kernel.org" <kvm->

Hi, Alexander
   Have you fixed the issue ?  I didn't run into it when building linux-next 20081210.  If it is pending, can you share the .config with me ? 
Xiantao

-----Original Message-----
From: Alexander Beregalov [mailto:a.beregalov@gmail.com] 
Sent: Tuesday, December 09, 2008 9:10 PM
To: linux-next@vger.kernel.org; anthony.xu@intel.com; Zhang, Xiantao; kvm-ia64@vger.kernel.org
Subject: next-20081209: fail to build ia64/kvm

arch/ia64/kvm/kvm-ia64.c: In function 'kvm_relocate_vmm':
arch/ia64/kvm/kvm-ia64.c:1547: error: dereferencing pointer to incomplete type
arch/ia64/kvm/kvm-ia64.c:1548: error: dereferencing pointer to incomplete type
