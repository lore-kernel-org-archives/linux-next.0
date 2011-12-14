From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for Dec 13 (kvm/vmx.c)
Date: Wed, 14 Dec 2011 12:28:22 +0200
Message-ID: <4EE87A46.2020409@redhat.com>
References: <20111213182111.6be64cf6eb7690f32f5003c2@canb.auug.org.au> <4EE7E53F.5070605@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:20865 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752793Ab1LNK2b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Dec 2011 05:28:31 -0500
In-Reply-To: <4EE7E53F.5070605@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>

On 12/14/2011 01:52 AM, Randy Dunlap wrote:
> On 12/12/2011 11:21 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20111212:
>
>
> arch/x86/built-in.o: In function `atomic_switch_perf_msrs':
> vmx.c:(.text+0x6b1d4): undefined reference to `perf_guest_get_msrs'
>
>

Thanks, patch posted.

-- 
error compiling committee.c: too many arguments to function
