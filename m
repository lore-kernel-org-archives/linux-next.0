From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: quota tree build failure
Date: Mon, 9 Feb 2009 22:36:35 +0100
Message-ID: <20090209213635.GA10838@duck.suse.cz>
References: <20090206141806.fdbd5cc3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:42798 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755885AbZBIVgh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2009 16:36:37 -0500
Content-Disposition: inline
In-Reply-To: <20090206141806.fdbd5cc3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

  Hi Stephen,

On Fri 06-02-09 14:18:06, Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/nfsd/vfs.c: In function 'nfsd_setattr':
> fs/nfsd/vfs.c:359: error: implicit declaration of function 'DQUOT_INIT'
> 
> Caused by commit 74d9386bc58d5f8b5bcee051e04e7123cd9cac88 ("quota: Remove
> uppercase aliases for quota functions").  Seems you missed at least one
> of the users.
  Thanks for the pointer. Fixed.

									Honza
