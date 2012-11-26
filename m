From: Seiji Aguchi <seiji.aguchi@hds.com>
Subject: RE: linux-next: manual merge of the ia64 tree with Linus' tree
Date: Mon, 26 Nov 2012 03:19:38 +0000
Message-ID: <A5ED84D3BB3A384992CBB9C77DEDA4D4149F993D@USINDEM103.corp.hds.com>
References: <20121126113141.3b624dc9e729039b54c51881@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from usindpps06.hds.com ([207.126.252.19]:58504 "EHLO
	usindpps06.hds.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753764Ab2KZDTv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 25 Nov 2012 22:19:51 -0500
In-Reply-To: <20121126113141.3b624dc9e729039b54c51881@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Luck, Tony" <tony.luck@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Colin Ian King <colin.king@canonical.com>, Anton Vorontsov <anton.vorontsov@linaro.org>

Hi,

This fix is reasonable to me.

Thanks,

Seiji

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Sunday, November 25, 2012 7:32 PM
> To: Luck, Tony
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Colin Ian King; Anton Vorontsov; Seiji Aguchi
> Subject: linux-next: manual merge of the ia64 tree with Linus' tree
> 
> Hi all,
> 
> Today's linux-next merge of the ia64 tree got a conflict in fs/pstore/platform.c between commit 70a6f46d7b0e ("pstore: Fix NULL
> pointer dereference in console writes") from Linus' tree and commit
> faa338315985 ("efi_pstore: Add a sequence counter to a variable name") from the ia64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc fs/pstore/platform.c
> index 947fbe0,e518f43..0000000
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@@ -173,7 -172,7 +173,7 @@@ static void pstore_console_write(struc
>   			spin_lock_irqsave(&psinfo->buf_lock, flags);
>   		}
>   		memcpy(psinfo->buf, s, c);
> - 		psinfo->write(PSTORE_TYPE_CONSOLE, 0, &id, 0, c, psinfo);
>  -		psinfo->write(PSTORE_TYPE_CONSOLE, 0, NULL, 0, 0, c, psinfo);
> ++		psinfo->write(PSTORE_TYPE_CONSOLE, 0, &id, 0, 0, c, psinfo);
>   		spin_unlock_irqrestore(&psinfo->buf_lock, flags);
>   		s += c;
>   		c = e - s;
