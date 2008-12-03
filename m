From: "Steve French" <smfrench@gmail.com>
Subject: Re: linux-next: manual merge of the cifs tree
Date: Tue, 2 Dec 2008 21:40:59 -0600
Message-ID: <524f69650812021940m58b5af28g50a7d6be0ac68d52@mail.gmail.com>
References: <20081203135101.cded370f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.172]:15902 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbYLCDlB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Dec 2008 22:41:01 -0500
Received: by ug-out-1314.google.com with SMTP id 39so3276763ugf.37
        for <linux-next@vger.kernel.org>; Tue, 02 Dec 2008 19:41:00 -0800 (PST)
In-Reply-To: <20081203135101.cded370f.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-cifs-client@lists.samba.org, linux-next@vger.kernel.org, Jeff Layton <jlayton@redhat.com>, Harvey Harrison <harvey.harrison@gmail.com>, "David S. Miller" <davem@davemloft.net>

Sounds like a good idea for you to carry this since the cifs-2.6.git
tree (which includes this) won't be merged until 2.6.29 opens up in a
few weeks

On Tue, Dec 2, 2008 at 8:51 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Steve,
>
> Today's linux-next merge of the cifs tree got a conflict in
> fs/cifs/connect.c between commit be859405487324ed548f1ba11dc949b8230ab991
> ("fs: replace NIPQUAD()") from the net tree and commits
> c14eef12edfa4b495fe9f6e81571759fe720db1d ("cifs: account for IPv6 in
> ses->serverName and clean up netbios name handling") and
> 6f694429f03ea9b9d2e253fdad2fc3b4cb801195 ("cifs: move allocation of new
> TCP_Server_Info into separate function") from the cifs tree.
>
> I fixed it up (see below) and can carry the fix as necessary.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
> diff --cc fs/cifs/connect.c
> index 204bd13,3519420..0000000
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@@ -2228,8 -2269,12 +2269,12 @@@ cifs_mount(struct super_block *sb, stru
>
>                /* new SMB session uses our srvTcp ref */
>                pSesInfo->server = srvTcp;
> -               sprintf(pSesInfo->serverName, "%pI4",
> -                       &sin_server->sin_addr.s_addr);
> +               if (srvTcp->addr.sockAddr6.sin6_family == AF_INET6)
>  -                      sprintf(pSesInfo->serverName, NIP6_FMT,
>  -                              NIP6(srvTcp->addr.sockAddr6.sin6_addr));
> ++                      sprintf(pSesInfo->serverName, "%pI6",
> ++                              &srvTcp->addr.sockAddr6.sin6_addr);
> +               else
>  -                      sprintf(pSesInfo->serverName, NIPQUAD_FMT,
>  -                              NIPQUAD(srvTcp->addr.sockAddr.sin_addr.s_addr));
> ++                      sprintf(pSesInfo->serverName, "%pI4",
> ++                              &srvTcp->addr.sockAddr.sin_addr.s_addr);
>
>                write_lock(&cifs_tcp_ses_lock);
>                list_add(&pSesInfo->smb_ses_list, &srvTcp->smb_ses_list);
>



-- 
Thanks,

Steve
