From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [Device-drivers-devel] [PATCH] video: backlight: adp8870: Fix
 warn_unused_result warning reported by Stephen Rothwell
Date: Tue, 2 Nov 2010 03:35:30 -0400
Message-ID: <AANLkTikq_D_HjMG0kSqTNc4aoFhtN71usVcNGGz2pAn4@mail.gmail.com>
References: <1288364066-18709-1-git-send-email-michael.hennerich@analog.com> <20101029122534.d4d6a439.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:38020 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754699Ab0KBHfw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2010 03:35:52 -0400
In-Reply-To: <20101029122534.d4d6a439.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: michael.hennerich@analog.com, drivers@analog.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, rpurdie@linux.intel.com, device-drivers-devel@blackfin.uclinux.org

On Fri, Oct 29, 2010 at 15:25, Andrew Morton wrote:
>> Subject: [PATCH] video: backlight: adp8870: Fix warn_unused_result w=
arning reported by Stephen Rothwell
>
> Lots of people are doing this "video: backlight: adp8870:" thing
> lately. =C2=A0And it's good, but why not just use
> "drivers/video/backlight/adp8860_bl.c" to identify the affected
> susbsytem/file/etc? =C2=A0It's simple and uniform. =C2=A0It's not alw=
ays the
> appropriate thing to do, but replacing the /'s with ": " seems rather
> random and pointless.

the colons and spaces make it a lot easier to pick out in a git log.
your suggestion makes it much harder to read due to the lack of
whitespace.
-mike
