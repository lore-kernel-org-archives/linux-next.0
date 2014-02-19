From: Tejun Heo <tj@kernel.org>
Subject: Re: Bogus dir.c file introduced at top level.
Date: Wed, 19 Feb 2014 13:25:24 -0500
Message-ID: <20140219182524.GO10134@htj.dyndns.org>
References: <5304F1A8.1030503@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f182.google.com ([209.85.216.182]:62134 "EHLO
	mail-qc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754034AbaBSSZ1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Feb 2014 13:25:27 -0500
Received: by mail-qc0-f182.google.com with SMTP id r5so1232327qcx.27
        for <linux-next@vger.kernel.org>; Wed, 19 Feb 2014 10:25:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5304F1A8.1030503@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

(cc'ing Greg)

On Wed, Feb 19, 2014 at 01:02:16PM -0500, Paul Gortmaker wrote:
> Hi Tiejun,
> 
> This merge:
> 
> commit a8fa94e0f2ab665f9aa665195618178b61ed8304
> Merge: 9561a89 b28a960
> Author: Tejun Heo <tj@kernel.org>
> Date:   Mon Feb 10 19:34:30 2014 -0500
> 
>     Merge branch 'master' into driver-core-next-test-merge-rc2
> 
> introduces a bogus copy of fs/kernfs/dir.c at the top level of
> the tree.  Seen in the Feb19th linux-next tree.

Gees, sorry about that.  Wrong git-add, I guess.  Unfortunately, the
commit seems to be buried under other commits already.  I'll send a
patch to remove the file soon.

Thanks.

-- 
tejun
