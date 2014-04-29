From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: kissb mkimage doesn't support extensa
Date: Tue, 29 Apr 2014 13:50:03 +1000
Message-ID: <1398743403.8217.7.camel@concordia>
References: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42041 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751460AbaD2DuG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Apr 2014 23:50:06 -0400
In-Reply-To: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>

On Sun, 2014-03-02 at 11:25 +0100, Geert Uytterhoeven wrote:
> http://kisskb.ellerman.id.au/kisskb/buildresult/10665903/
> 
> Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k,
> microblaze, mips, mips64, nios, nios2, ppc, s390, sh, sparc, sparc64,
> blackfin, avr32

I've upgraded to the latest version in Debian (2014.01), but it still doesn't
seem to support xtensa.

  $ /usr/bin/mkimage -A xtensa
  
  Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k, microblaze,
  mips, mips64, nios2, powerpc, ppc, s390, sh, sparc, sparc64, blackfin, avr32,
  nds32, or1k, sandbox, arm64

cheers
