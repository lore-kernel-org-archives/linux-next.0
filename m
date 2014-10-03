From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2014-10-02-16-22 uploaded (lustre)
Date: Fri, 03 Oct 2014 10:13:50 -0700
Message-ID: <542ED94E.8080307@infradead.org>
References: <542dde4c.uoQAbw1Ng2akSWKx%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:35255 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753288AbaJCROA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Oct 2014 13:14:00 -0400
In-Reply-To: <542dde4c.uoQAbw1Ng2akSWKx%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, HPDD-discuss@ml01.01.org, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

On 10/02/14 16:22, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2014-10-02-16-22 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.

on i386, when CONFIG_PROC_FS is not enabled:

ERROR: "obd_memory" [drivers/staging/lustre/lustre/obdclass/obdclass.ko] undefined!


-- 
~Randy
