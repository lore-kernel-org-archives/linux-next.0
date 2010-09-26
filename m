From: CAI Qian <caiqian@redhat.com>
Subject: Re: kexec load failure introduced by "x86, memblock: Replace
 e820_/_early string with memblock_"
Date: Sun, 26 Sep 2010 06:37:53 -0400 (EDT)
Message-ID: <1734560070.1994601285497473017.JavaMail.root@zmail06.collab.prod.int.phx2.redhat.com>
References: <4C9EEE98.7020906@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx4-phx2.redhat.com ([209.132.183.25]:36992 "EHLO
	mx02.colomx.prod.int.phx2.redhat.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757083Ab0IZKiM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Sep 2010 06:38:12 -0400
In-Reply-To: <4C9EEE98.7020906@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>
Cc: linux-next <linux-next@vger.kernel.org>, kexec <kexec@lists.infradead.org>, "H. Peter Anvin" <hpa@zytor.com>


----- "Yinghai Lu" <yinghai@kernel.org> wrote:

> On 09/25/2010 11:55 PM, CAI Qian wrote:
> >>
> >> are you kexec from 2.6.35+ to 2.6.36-rc3+?
> > No, both kernels were the same version. I am sorry the above logs
> were misleading that were copy-and-pasted from different kernel
> versions.
> 
> can you check tip instead of next tree?
I am wondering which patches there do you think would make the regression go away?
> 
> Yinghai
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
