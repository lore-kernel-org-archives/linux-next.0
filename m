From: Matteo Croce <mcroce@redhat.com>
Subject: Re: [PATCH] firmware_loader: fix build without sysctl
Date: Fri, 31 May 2019 11:12:39 +0200
Message-ID: <CAGnkfhwJm0N2WvLv9o+DZeL9JjDsDp3-TB-G6iS_6mhTyzYRHQ@mail.gmail.com>
References: <20190531012649.31797-1-mcroce@redhat.com> <dbc00eaa-c6e9-45b2-7232-5af35fdea113@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dbc00eaa-c6e9-45b2-7232-5af35fdea113@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 31, 2019 at 4:15 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 5/30/19 6:26 PM, Matteo Croce wrote:
> > firmware_config_table has references to the sysctl code which
> > triggers a build failure when CONFIG_PROC_SYSCTL is not set:
> >
> >     ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x30): undefined reference to `sysctl_vals'
> >     ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x38): undefined reference to `sysctl_vals'
> >     ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x70): undefined reference to `sysctl_vals'
> >     ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x78): undefined reference to `sysctl_vals'
> >
> > Put the firmware_config_table struct under #ifdef CONFIG_PROC_SYSCTL.
> >
> > Fixes: 6a33853c5773 ("proc/sysctl: add shared variables for range check")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Matteo Croce <mcroce@redhat.com>
>
> Works for me.
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>
> Thanks.
>
> > ---
> >  drivers/base/firmware_loader/fallback_table.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/base/firmware_loader/fallback_table.c b/drivers/base/firmware_loader/fallback_table.c
> > index 58d4a1263480..18d646777fb9 100644
> > --- a/drivers/base/firmware_loader/fallback_table.c
> > +++ b/drivers/base/firmware_loader/fallback_table.c
> > @@ -23,6 +23,8 @@ struct firmware_fallback_config fw_fallback_config = {
> >  };
> >  EXPORT_SYMBOL_GPL(fw_fallback_config);
> >
> > +#ifdef CONFIG_PROC_SYSCTL
> > +
> >  struct ctl_table firmware_config_table[] = {
> >       {
> >               .procname       = "force_sysfs_fallback",
> > @@ -45,3 +47,5 @@ struct ctl_table firmware_config_table[] = {
> >       { }
> >  };
> >  EXPORT_SYMBOL_GPL(firmware_config_table);
> > +
> > +#endif
> >
>
>
> --
> ~Randy

Hi,

please correct the Fixes tag if possible.
It seems that the hash of the offending commit now is d91bff3011cf

Regards,
-- 
Matteo Croce
per aspera ad upstream
