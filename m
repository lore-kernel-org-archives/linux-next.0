From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the mips tree
Date: Thu, 01 May 2014 20:50:18 +0200
Message-ID: <7356166.EVKMfYyT94@vostro.rjw.lan>
References: <20140501120932.ff26772f983a436b4453c915@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:57401 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750782AbaEASds (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 May 2014 14:33:48 -0400
In-Reply-To: <20140501120932.ff26772f983a436b4453c915@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Stratos Karafotis <stratosk@semaphore.gr>

On Thursday, May 01, 2014 12:09:32 PM Stephen Rothwell wrote:
> 
> --Signature=_Thu__1_May_2014_12_09_32_+1000_d7zY1SkU6vg6nEQn
> Content-Type: text/plain; charset=US-ASCII
> Content-Disposition: inline
> Content-Transfer-Encoding: quoted-printable
> 
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> arch/mips/loongson/lemote-2f/clock.c between commit a68ce6507a45
> ("MIPS/loongson2_cpufreq: Fix CPU clock rate setting") from the mips tree
> and commit 4966ee4037fe ("mips: lemote 2f: Use cpufreq_for_each_entry
> macro for iteration") from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks!

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
