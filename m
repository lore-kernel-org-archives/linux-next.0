From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: linux-next: New build failures in Sep 25 tree
Date: Fri, 26 Sep 2014 10:59:00 +0300
Message-ID: <20140926075859.GA21697@chokladfabriken.org>
References: <20140925202559.GA1750@roeck-us.net>
	<CAMuHMdXE4aU1qZ9iGBT48QfMv5v7gsBZSjL_1_D8p=JBJfeN6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-bounces@lists.openrisc.net>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXE4aU1qZ9iGBT48QfMv5v7gsBZSjL_1_D8p=JBJfeN6A@mail.gmail.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ulf Hansson <ulf.hansson@linaro.org>, Vineet Gupta <vgupta@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>, Linux-Next <linux-next@vger.kernel.org>, linux <linux@lists.openrisc.net>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 26, 2014 at 08:30:57AM +0200, Geert Uytterhoeven wrote:
> Hi G=FCnther,
> =

> [cc openrisc]
> =

> On Thu, Sep 25, 2014 at 10:25 PM, Guenter Roeck <linux@roeck-us.net> wrot=
e:
> > New build failures:
> =

> > openrisc-defconfig
> >
> > In file included from arch/openrisc/kernel/signal.c:31:0:
> > ./arch/openrisc/include/asm/syscall.h: In function 'syscall_get_arch':
> > ./arch/openrisc/include/asm/syscall.h:77:9: error: 'EM_OPENRISC' undecl=
ared
> =

> That's not a new one. It's been failing for half or year or so.
> =

> If you only see it now, that means something else got fixed ;-)
> =


>From what I can see, it's caused by
ce5d112827e5 ("ARCH: AUDIT: implement syscall_get_arch for all arches")
that got (re?)introduced two days ago.

To me it seems that the problem is that EM_OPENRISC is
missing in include/uapi/linux/elf-em.h, but if that's the case,
I think microblaze have the same problem with that patch applied.

Stefan
