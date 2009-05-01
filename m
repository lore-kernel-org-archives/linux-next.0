From: Steve French <smfrench@gmail.com>
Subject: Re: linux-next: cifs tree build warning
Date: Thu, 30 Apr 2009 23:04:22 -0500
Message-ID: <524f69650904302104t7cb16ca2nc1ccb62fec7cbe1@mail.gmail.com>
References: <20090501132848.fc34569e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f166.google.com ([209.85.217.166]:37420 "EHLO
	mail-gx0-f166.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720AbZEAEEX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 00:04:23 -0400
Received: by gxk10 with SMTP id 10so4556506gxk.13
        for <linux-next@vger.kernel.org>; Thu, 30 Apr 2009 21:04:22 -0700 (PDT)
In-Reply-To: <20090501132848.fc34569e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-cifs-client@lists.samba.org, linux-next@vger.kernel.org, Igor Mammedov <niallain@gmail.com>

On Thu, Apr 30, 2009 at 10:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Steve,
>
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>
> fs/cifs/cifs_dfs_ref.c: In function 'cifs_dfs_follow_mountpoint':
> fs/cifs/cifs_dfs_ref.c:345: warning: ISO C90 forbids mixed declarations and code
>
> Introduced by commit 1af28ceb923d04357733642a3dbc4497da4db1c2 ("Enable
> dfs submounts to handle remote referrals").

Fixed - Igor had inverted two statements.


-- 
Thanks,

Steve
