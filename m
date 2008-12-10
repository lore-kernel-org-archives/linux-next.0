From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: next-20081209: fail to build ia64/kvm
Date: Wed, 10 Dec 2008 14:30:10 +0300
Message-ID: <a4423d670812100330y102b6c3ek1d895a7e42fe10@mail.gmail.com>
References: <a4423d670812090509q4d3dbe15h780ec3f4f11d1b3c@mail.gmail.com>
	 <706158FABBBA044BAD4FE898A02E4BC219CABA93@pdsmsx503.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rn-out-0910.google.com ([64.233.170.186]:44266 "EHLO
	rn-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbYLJLaL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Dec 2008 06:30:11 -0500
Received: by rn-out-0910.google.com with SMTP id k40so389160rnd.17
        for <linux-next@vger.kernel.org>; Wed, 10 Dec 2008 03:30:10 -0800 (PST)
In-Reply-To: <706158FABBBA044BAD4FE898A02E4BC219CABA93@pdsmsx503.ccr.corp.intel.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Zhang, Xiantao" <xiantao.zhang@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "kvm-ia64@vger.kernel.org" <kvm-ia64@vger.kernel.org>

2008/12/10 Zhang, Xiantao <xiantao.zhang@intel.com>:
> Hi, Alexander
>   Have you fixed the issue ?  I didn't run into it when building linux-next 20081210.  If it is pending, can you share the .config with me ?

It does not build without CONFIG_MODULE. Should it depend on it?

> Xiantao
>
> -----Original Message-----
> From: Alexander Beregalov [mailto:a.beregalov@gmail.com]
> Sent: Tuesday, December 09, 2008 9:10 PM
> To: linux-next@vger.kernel.org; anthony.xu@intel.com; Zhang, Xiantao; kvm-ia64@vger.kernel.org
> Subject: next-20081209: fail to build ia64/kvm
>
> arch/ia64/kvm/kvm-ia64.c: In function 'kvm_relocate_vmm':
> arch/ia64/kvm/kvm-ia64.c:1547: error: dereferencing pointer to incomplete type
> arch/ia64/kvm/kvm-ia64.c:1548: error: dereferencing pointer to incomplete type
>
