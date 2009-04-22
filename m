From: David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>
Subject: Re: [BUILD FAILURE 11/12] Next April 21 : PPC64 randconfig [drivers/usb/host/ohci-hcd.o]
Date: Tue, 21 Apr 2009 19:19:37 -0700
Message-ID: <200904211919.38104.david-b@pacbell.net>
References: <1240340081.9110.144.camel@subratamodak.linux.ibm.com> <5A202317-5104-4784-845B-B8C46E0A3C48@kernel.crashing.org> <49EE4341.50701@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49EE4341.50701-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linuxppc-dev <Linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sachinp <sachinp-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Tuesday 21 April 2009, Randy Dunlap wrote:
>=20
> > Since its feasible to say 'n' to both we get the compile error. =A0=
How do
> > we enforce having at least one set?
>=20
> Looks like using "choice" without "optional" would do it.
> See Documentation/kbuild/kconfig-language.txt and various examples
> in Kconfig* files.

That won't quite work ... "at least one" includes "two"
(i.e. a PCI card in little-endian, a native controller
in big-endian).  Real-world systems need such configs,
or so I'm told, and that's why their supported.

Is there maybe a way to force Kconfig to just reject
such illegal configs -- neither option set -- rather
than trying some how to fix it?

Or maybe ... if neither one is set, have the header
force both on, and issue a warning.


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
