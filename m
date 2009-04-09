From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [BUILD FAILURE 04] Next April 9 : PPC64 randconfig
	[drivers/net/ibm_newemac/core.c]
Date: Thu, 9 Apr 2009 10:31:12 -0400
Message-ID: <20090409143112.GA7538@yoda.jdub.homelinux.org>
References: <1239285152.5188.66.camel@subratamodak.linux.ibm.com> <BE92FB74-1784-414B-B27F-8329185EB3AE@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761875AbZDIObu@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BE92FB74-1784-414B-B27F-8329185EB3AE@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: subrata@linux.vnet.ibm.com, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-net@vger.kernel.org, Greg KH <greg@kroah.com>, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 09, 2009 at 09:28:23AM -0500, Kumar Gala wrote:
>
> On Apr 9, 2009, at 8:52 AM, Subrata Modak wrote:
>
>> Observed the following build error:
>>
>> CC      drivers/net/ibm_newemac/core.o
>> drivers/net/ibm_newemac/core.c: In function =E2=80=98emac_probe=E2=80=
=99:
>> drivers/net/ibm_newemac/core.c:2831: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98open=E2=80=99
>> drivers/net/ibm_newemac/core.c:2834: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98tx_timeout=E2=80=99
>> drivers/net/ibm_newemac/core.c:2836: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98stop=E2=80=99
>> drivers/net/ibm_newemac/core.c:2837: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98get_stats=E2=80=99
>> drivers/net/ibm_newemac/core.c:2838: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98set_multicast_list=E2=80=99
>> drivers/net/ibm_newemac/core.c:2839: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98do_ioctl=E2=80=99
>> drivers/net/ibm_newemac/core.c:2841: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98hard_start_xmit=E2=80=99
>> drivers/net/ibm_newemac/core.c:2842: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98change_mtu=E2=80=99
>> drivers/net/ibm_newemac/core.c:2845: error: =E2=80=98struct net_devi=
ce=E2=80=99 has no
>> member named =E2=80=98hard_start_xmit=E2=80=99
>> make[3]: *** [drivers/net/ibm_newemac/core.o] Error 1
>> make[2]: *** [drivers/net/ibm_newemac] Error 2
>> make[1]: *** [drivers/net] Error 2
>> make: *** [drivers] Error 2
>>
>> Regards--
>> Subrata
>>
>> <randconfig4-ppc64-next20090409.txt>
>
> This is because CONFIG_COMPAT_NET_DEV_OPS isnt set and needs to be fo=
r =20
> this driver to build.  I've asked the netdev guys about either fixing=
 =20
> the driver or adding the proper thing to Kconfig to select =20
> CONFIG_COMPAT_NET_DEV_OPS.

Thanks!

If someone has pointers on what needs to be done to fix it, let me know=
=2E

josh
