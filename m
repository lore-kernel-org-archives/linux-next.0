From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs-miklos tree with the
 overlayfs tree and build failure
Date: Tue, 31 Jan 2017 21:38:43 +1100
Message-ID: <20170131213843.007ba67a@canb.auug.org.au>
References: <20170131111656.3e77663b@canb.auug.org.au>
        <CAOQ4uxhUQxJs_3SW0Gtm-UAEbvWR7BsjudNH8LUX24OwYnvyZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47631 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751272AbdAaKjJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Jan 2017 05:39:09 -0500
In-Reply-To: <CAOQ4uxhUQxJs_3SW0Gtm-UAEbvWR7BsjudNH8LUX24OwYnvyZA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Hi Amir,

On Tue, 31 Jan 2017 08:47:43 +0200 Amir Goldstein <amir73il@gmail.com> wrote:
>
> That's strange.
> overlayfs-next whose head is the for mentioned commit is based on
> v4.10-rc6 and has no duplicated patches AFAICS

The duplicate patches are between v4.10-rc1 and the vfs-miklos tree and
the overlayfs tree includes v4.10-rc1, so there is interactions there.

> Please note that my patch moves do_clone_file_range() from line 1743
> to line 2566,
> because it needs to use file_start_write(), which is defined in line 2533.
> so perhaps the conflict was not resolved correctly?

That is probably what happened, but if the vfs-miklos tree is cleaned
up, these conflicts will all go away.

-- 
Cheers,
Stephen Rothwell
