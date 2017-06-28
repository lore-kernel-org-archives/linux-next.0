From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the file-locks
 tree
Date: Tue, 27 Jun 2017 20:01:56 -0600
Message-ID: <4feec680-6d4f-abbe-c025-61b462612dde@kernel.dk>
References: <20170628115721.3e594e2c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:36396 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753503AbdF1CCA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Jun 2017 22:02:00 -0400
Received: by mail-pf0-f179.google.com with SMTP id q86so25298587pfl.3
        for <linux-next@vger.kernel.org>; Tue, 27 Jun 2017 19:02:00 -0700 (PDT)
In-Reply-To: <20170628115721.3e594e2c@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 06/27/2017 07:57 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   include/linux/fs.h
> 
> between commit:
> 
>   3f64df8a51ce ("fs: new infrastructure for writeback error handling and reporting")
> 
> from the file-locks tree and commit:
> 
>   c75b1d9421f8 ("fs: add fcntl() interface for setting/getting write life time hints")
> 
> from the block tree.

Looks like we stole the same hole! Let's just merge it like this, then
post merge I (or Jeff) can move the member to a better location.

-- 
Jens Axboe
