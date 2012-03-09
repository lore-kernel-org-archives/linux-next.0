From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: toolchain version for mips builds, esp. cavium
Date: Fri, 9 Mar 2012 17:01:07 -0500
Message-ID: <CAP=VYLpk9RonUUWmnC2-7wPi7Oqra_y7K4qQNLfMYqNKMo8QMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:58178 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755764Ab2CIWBJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 17:01:09 -0500
Received: by lahj13 with SMTP id j13so2144081lah.19
        for <linux-next@vger.kernel.org>; Fri, 09 Mar 2012 14:01:07 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: david.daney@cavium.com, ralf@linux-mips.org, linux-next@vger.kernel.org

Hi Stephen,

The linux-next builds for cavium defconfig have been failing for
quite some time now, since it tries to use gcc-4.2 and the option
for the octeon didn't appear until gcc-4.4 ("-march=octeon")

http://kisskb.ellerman.id.au/kisskb/target/5509/

I'm not sure there is any real "best" choice (hence I cc'd David
and Ralf) but I just tested by grabbing the toolchain from here:

ftp://ftp.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.5.2/

and it seems fine with building the cavium.  I'm not sure if the
kisskb does per-target toolchain, or needs it per-arch, but I would
suspect that the above is fine for all of mips anyway.

What is the process for getting a different toolchain building the
cavium in linux-next?

Thanks,
Paul.
