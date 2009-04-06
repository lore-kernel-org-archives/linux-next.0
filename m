From: "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Subject: Re: next-20090406: nfsd build fails
Date: Mon, 6 Apr 2009 13:11:46 -0400
Message-ID: <20090406171146.GA32436@fieldses.org>
References: <a4423d670904060027y44550d99g2cb40ce415dbb048@mail.gmail.com> <49D9C308.6020500@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49D9C308.6020500-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Cc: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, andros-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, pNFS Mailing List <pnfs-6DNke4IJHB0gsBAKwltoeQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 06, 2009 at 11:53:28AM +0300, Benny Halevy wrote:
> On Apr. 06, 2009, 10:27 +0300, Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi
> > 
> > fs/nfsd/nfssvc.c: In function 'set_max_drc':
> > fs/nfsd/nfssvc.c:240: error: 'NFSD_DRC_SIZE_SHIFT' undeclared
> > 
> > CONFIG_NFSD_V4 is not set
> 
> Hi Alexander,
> 
> Thanks for reporting this!
> 
> Andy, Bruce: please see attached 2 patches fixing compile/link errors
> with DRC under !defined(CONFIG_NFSD_V4):
> 
> [PATCH 1/2] SQUASHEM: nfsd41: define NFSD_DRC_SIZE_SHIFT in set_max_drc
> [PATCH 2/2] SQUASHME: nfsd41: define nfsd4_set_statp as noop for !CONFIG_NFSD_V4

Thanks, applied.

Committing on top (not squashing) since I'd rather not rewrite history
on a branch I've already sent a pull request for.

(In fact, I'll try to stop rebasing those for-next branches at all this
time around.)

--b.
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
