From: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: next-20090406: nfsd build fails
Date: Mon, 06 Apr 2009 11:53:28 +0300
Message-ID: <49D9C308.6020500@panasas.com>
References: <a4423d670904060027y44550d99g2cb40ce415dbb048@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a4423d670904060027y44550d99g2cb40ce415dbb048-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, andros-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org, bfields-vtMw8L3fJ9vSiEDVxGk4TQ@public.gmane.org
Cc: "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, pNFS Mailing List <pnfs-6DNke4IJHB0gsBAKwltoeQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Apr. 06, 2009, 10:27 +0300, Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi
> 
> fs/nfsd/nfssvc.c: In function 'set_max_drc':
> fs/nfsd/nfssvc.c:240: error: 'NFSD_DRC_SIZE_SHIFT' undeclared
> 
> CONFIG_NFSD_V4 is not set

Hi Alexander,

Thanks for reporting this!

Andy, Bruce: please see attached 2 patches fixing compile/link errors
with DRC under !defined(CONFIG_NFSD_V4):

[PATCH 1/2] SQUASHEM: nfsd41: define NFSD_DRC_SIZE_SHIFT in set_max_drc
[PATCH 2/2] SQUASHME: nfsd41: define nfsd4_set_statp as noop for !CONFIG_NFSD_V4

Benny
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
