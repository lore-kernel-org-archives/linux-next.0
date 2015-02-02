From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 02 Feb 2015 10:09:30 +0100
Message-ID: <54CF3ECA.2040704@6wind.com>
References: <20150202133354.06329e97@canb.auug.org.au>
Reply-To: nicolas.dichtel@6wind.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:63887 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932651AbbBBJJd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Feb 2015 04:09:33 -0500
Received: by mail-wg0-f43.google.com with SMTP id y19so37454378wgg.2
        for <linux-next@vger.kernel.org>; Mon, 02 Feb 2015 01:09:32 -0800 (PST)
In-Reply-To: <20150202133354.06329e97@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Graf <tgraf@suug.ch>

Le 02/02/2015 03:33, Stephen Rothwell a =E9crit :
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in
> drivers/net/vxlan.c between commit 33564bbb2cf1 ("vxlan: setup the
> right link netns in newlink hdlr") from the net tree and commit
> ac5132d1a03f ("vxlan: Only bind to sockets with compatible flags
> enabled") from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).
Acked-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
