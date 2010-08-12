From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for August 9 (nfs)
Date: Thu, 12 Aug 2010 09:18:42 -0700
Message-ID: <20100812091842.6a3b84b9.randy.dunlap@oracle.com>
References: <20100809132314.789e13f3.sfr@canb.auug.org.au>
	<20100809100856.b03a9bc1.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100809100856.b03a9bc1.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, 9 Aug 2010 10:08:56 -0700 Randy Dunlap wrote:

ping??

> On Mon, 9 Aug 2010 13:23:14 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > As the merge window is open, please do not add 2.6.37 material to your
> > linux-next included trees until after 2.6.36-rc1.
> > 
> > Changes since 20100807:
> 
> 
> ERROR: "svc_gss_principal" [fs/nfs/nfs.ko] undefined!
> 
> 
> because in fs/nfs/Kconfig, NFS_V4 selects RPCSEC_GSS_KRB5
> and/or in fs/nfsd/Kconfig, NFSD_V4 selects RPCSEC_GSS_KRB5.
> 
> RPCSEC_GSS_KRB5 does 5 selects, but none of these is enforced/followed
> by the fs/nfs[d]/Kconfig configs:
> 
> 	select SUNRPC_GSS
> 	select CRYPTO
> 	select CRYPTO_MD5
> 	select CRYPTO_DES
> 	select CRYPTO_CBC
> 
> 
> Failing config is attached.
> ---


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
