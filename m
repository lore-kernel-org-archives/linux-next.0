From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: removal of the lblnet tree
Date: Wed, 9 Mar 2016 08:31:51 -0500
Message-ID: <CAHC9VhQNHdfik9_YXnOtsN0SOMFitGYd9NPWgvzTR2FpG+w1yg@mail.gmail.com>
References: <20160309161835.1c57045d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34991 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753608AbcCINbw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2016 08:31:52 -0500
Received: by mail-oi0-f45.google.com with SMTP id c203so35036140oia.2
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2016 05:31:51 -0800 (PST)
In-Reply-To: <20160309161835.1c57045d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 9, 2016 at 12:18 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> I noticed that the lblnet tree
>
>   git://git.infradead.org/users/pcmoore/lblnet branch next
>
> has not been updated since v3.18.  I am going to remove it from
> linux-next tomorrow unless I hear that it may be useful.  It can always
> be easily added back if it proves useful in the future.

That sounds fine to me, most of the recent labeled networking work
that hasn't gone via the netdev tree I've just been putting in the
SELinux tree.

-- 
paul moore
www.paul-moore.com
