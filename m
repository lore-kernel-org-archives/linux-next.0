From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for March 27 (longhaul build error)
Date: Fri, 27 Mar 2009 18:42:35 +0100
Message-ID: <200903271842.37665.bzolnier@gmail.com>
References: <20090327231924.4e4168c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f169.google.com ([209.85.218.169]:42808 "EHLO
	mail-bw0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754484AbZC0RmJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2009 13:42:09 -0400
In-Reply-To: <20090327231924.4e4168c5.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Len Brown <len.brown@intel.com>, Bob Moore <robert.moore@intel.com>, Lin Ming <ming.m.lin@intel.com>


Hi,

On Friday 27 March 2009, Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20090326:

I hit the following build error using OpenSUSE's kernel config:

arch/x86/kernel/cpu/cpufreq/longhaul.c: In function =E2=80=98longhaul_s=
etstate=E2=80=99:
arch/x86/kernel/cpu/cpufreq/longhaul.c:308: error: implicit declaration=
 of function =E2=80=98acpi_set_register=E2=80=99
make[1]: *** [arch/x86/kernel/cpu/cpufreq/longhaul.o] Error 1
make: *** [arch/x86/kernel/cpu/cpufreq/longhaul.o] Error 2

Len, it seems like the following patch managed to slip through the crac=
ks:

	http://patchwork.kernel.org/patch/12715/

Thanks,
Bart
