From: David Teigland <teigland@redhat.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the dlm tree
Date: Mon, 18 Sep 2017 17:00:53 -0500
Message-ID: <20170918220053.GD6025@redhat.com>
References: <20170919074919.1aee891b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38678 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750783AbdIRWAz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Sep 2017 18:00:55 -0400
Content-Disposition: inline
In-Reply-To: <20170919074919.1aee891b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>, "tsutomu.owa@toshiba.co.jp" <tsutomu.owa@toshiba.co.jp>, Tadashi Miyauchi <miyauchi@toshiba-tops.co.jp>

On Tue, Sep 19, 2017 at 07:49:19AM +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Commits
> 
>   bcc976a145c9 ("DLM: Eliminate CF_CONNECT_PENDING flag")
>   c071b28b2bd5 ("DLM: Eliminate CF_WRITE_PENDING flag")
>   782551aac851 ("DLM: Fix saving of NULL callbacks")
> 
> are missing a Signed-off-by from their author.

Thanks, should be fixed now.
Dave
