From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: quota tree build warning
Date: Thu, 5 Feb 2009 12:53:19 +0100
Message-ID: <20090205115318.GA22417@duck.suse.cz>
References: <20090205172823.e6b203bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:60055 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754813AbZBELxV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 06:53:21 -0500
Content-Disposition: inline
In-Reply-To: <20090205172823.e6b203bf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mingming Cao <cmm@us.ibm.com>, Theodore Ts'o <tytso@mit.edu>

  Hi Stephen,

On Thu 05-02-09 17:28:23, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> fs/ext4/super.c:949: warning: initialization from incompatible pointer type
> 
> The line is this:
> 
>         .get_reserved_space = ext4_get_reserved_space,
> 
> Where ext4_get_reserved_space() returns unsigned long long, but the
> get_reserved_space prototype returns a qsize_t (which is long long).
> 
> Introduced by commit dafa34c7ba30012a7cacffb98e978e5edb74457f ("ext4: quota
> reservation for delayed allocation").
  Thanks. Should be fixed now.

									Honza

-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
