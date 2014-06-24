From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: the selinux tree needs cleaning up
Date: Tue, 24 Jun 2014 14:03:08 -0400
Message-ID: <32647147.KmAPzBrbMT@sifl>
References: <20140618084046.1bce12cc@canb.auug.org.au> <20140620085931.6427678d@canb.auug.org.au> <1474416.aEfMv8Ny53@sifl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:54621 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753450AbaFXSDM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Jun 2014 14:03:12 -0400
Received: by mail-qc0-f169.google.com with SMTP id c9so647765qcz.14
        for <linux-next@vger.kernel.org>; Tue, 24 Jun 2014 11:03:11 -0700 (PDT)
In-Reply-To: <1474416.aEfMv8Ny53@sifl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Morris <james.l.morris@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>

On Friday, June 20, 2014 12:06:28 PM Paul Moore wrote:

{big snip}

> Stephen, assuming for a moment that I created a fresh branch, based against
> 3.15, and then added the SELinux patches for 3.16 (basically the few new
> patches that were in the ole #next branch) would that serve as a reasonable
> basis for a new SELinux #next branch?  Around the -rc5/6/7 timeframe I would
> send a pull request to James to pull from this next branch into the Linux
> Security branch for 3.17.  Once 3.16 is released, I would merge that into
> this new #next branch and continue with the next round of patches.
> 
> FYI, more or less, the above is the process we've settled upon for all of
> the trees that get accumulated into the Linux Security tree.

Hi Stephen,

Does the above work for you in linux-next?  I'd like to try and resolve this 
sooner rather than later and I imagine you feel the same ...

-- 
paul moore
www.paul-moore.com
