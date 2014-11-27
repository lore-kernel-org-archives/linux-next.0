From: Boaz Harrosh <boaz@plexistor.com>
Subject: Re: linux-next: manual merge of the staging tree with the kbuild
 tree
Date: Thu, 27 Nov 2014 10:24:37 +0200
Message-ID: <5476DFC5.6020709@plexistor.com>
References: <20141127190508.3305dfe8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:64202 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbaK0IYl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 Nov 2014 03:24:41 -0500
Received: by mail-wg0-f44.google.com with SMTP id b13so5788352wgh.3
        for <linux-next@vger.kernel.org>; Thu, 27 Nov 2014 00:24:39 -0800 (PST)
In-Reply-To: <20141127190508.3305dfe8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Romer <benjamin.romer@unisys.com>

> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict
> in .gitignore between commit dfe0487249e5 (".gitignore: Add Kdevelop4
> project files") from the kbuild tree and commit 75185f57f110 ("staging:
> unisys: fix CamelCase macro names in controlframework.h") from the
> staging tree.
> 

Hi Greg Michal

I suggest to unify the two like:

+# IDE project files
+*.kdev4
+.project
+.cproject

And put the one patch from one tree. There is no need to
comment about every IDE out there, just the one section for
them all, I think

Tell me if you guys need a patch and/or which tree should take
it?

Thanks
Boaz

> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc .gitignore
> index ce57b79670a5,6bfac06d79ca..000000000000
> --- a/.gitignore
> +++ b/.gitignore
> @@@ -97,5 -97,6 +97,9 @@@ x509.genke
>   # Kconfig presets
>   all.config
>   
>  +# Kdevelop4
>  +*.kdev4
> ++
> + #eclipse files
> + .project
> + .cproject
