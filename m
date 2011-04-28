From: "Gustavo F. Padovan" <padovan@profusion.mobi>
Subject: Re: linux-next: manual merge of the bluetooth tree with Linus' tree
Date: Thu, 28 Apr 2011 00:36:27 -0300
Message-ID: <20110428033626.GA2214@joana>
References: <20110428113404.081a74a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:42281 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836Ab1D1DgN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Apr 2011 23:36:13 -0400
Content-Disposition: inline
In-Reply-To: <20110428113404.081a74a5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@profusion.mobi>

Hi Stephen,

* Stephen Rothwell <sfr@canb.auug.org.au> [2011-04-28 11:34:04 +1000]:

> Hi Gustavo,
> 
> Today's linux-next merge of the bluetooth tree got a conflict in
> net/bluetooth/l2cap_sock.c between commit 25985edcedea ("Fix common
> misspellings") from Linus' tree and commit dbe1c0aea650 ("Bluetooth: Move
> conn to struct l2cap_chan") from the bluetooth tree.
> 
> Just context changes.  I fxied it up (see below) and can carry the fix as
> necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc net/bluetooth/l2cap_sock.c
> index 47394a1,09cc7a0..0000000
> --- a/net/bluetooth/l2cap_sock.c
> +++ b/net/bluetooth/l2cap_sock.c
> @@@ -678,8 -692,8 +692,8 @@@ static int l2cap_sock_setsockopt(struc
>   		}
>   
>   		if (opt == BT_FLUSHABLE_OFF) {
> - 			struct l2cap_conn *conn = l2cap_pi(sk)->conn;
> + 			struct l2cap_conn *conn = chan->conn;
>  -			/* proceed futher only when we have l2cap_conn and
>  +			/* proceed further only when we have l2cap_conn and
>   			   No Flush support in the LM */
>   			if (!conn || !lmp_no_flush_capable(conn->hcon->hdev)) {
>   				err = -EINVAL;

Thanks for the fix. 

-- 
Gustavo F. Padovan
http://profusion.mobi
