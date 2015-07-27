From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Crash in -next due to 'MIPS: Move FP usage checks into
 protected_{save, restore}_fp_context'
Date: Mon, 27 Jul 2015 13:41:04 -0700
Message-ID: <20150727204104.GA1198@roeck-us.net>
References: <20150715160918.GA27653@roeck-us.net>
 <20150727150652.GA1756@roeck-us.net>
 <20150727172142.GE7289@NP-P-BURTON>
 <20150727174622.GA10708@roeck-us.net>
 <20150727180442.GG7289@NP-P-BURTON>
 <20150727194401.GC14674@roeck-us.net>
 <20150727200214.GH7289@NP-P-BURTON>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37327 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752718AbbG0UlH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2015 16:41:07 -0400
Content-Disposition: inline
In-Reply-To: <20150727200214.GH7289@NP-P-BURTON>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org

Hi Paul,

On Mon, Jul 27, 2015 at 01:02:14PM -0700, Paul Burton wrote:
> 
> Hi Guenter,
> 
> I'm currently mailing out v2 of the series which should fix your
> problem. It was an issue where the kernel would check the FP context for
> whether a SIGFPE should be generated even in cases where FP had not been
> used by userland, and thus had not been initialised. My userland is
> hard float & thus makes use of the FPU early whilst I believe yours is
> soft float, which explains the difference in behaviour.
> 
> I think the endian difference probably boils down to what garbage the
> initial FP context contained.
> 
Thanks a lot for the fix!

Guenter
