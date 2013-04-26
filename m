From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: linux-next: Tree for Apr 26
Date: Fri, 26 Apr 2013 14:06:06 +0200
Message-ID: <20130426120606.GB10241@free.fr>
References: <20130426180357.7599d1b6b7965470905dcdf3@canb.auug.org.au>
 <CA+icZUWt_W5FUQgQ2TFoQU0df+sAbxZZE8AcD16T3f_fiTD9DQ@mail.gmail.com>
 <517A4FC1.3070605@suse.cz>
 <20130426100435.GA28733@sepie.suse.cz>
 <CA+icZUVOfB2JuL1xh1EO1hTP_eOkntYFKsUJ0Zp6VZqn09NABA@mail.gmail.com>
 <CA+icZUWNVEsiTs6u_2R9krb45ub4t-pZj_VEPRmrX2c4DzwfmA@mail.gmail.com>
 <CA+icZUXSsqN1iE3ttQakvpZqG-oOL9NR6RMUezB7LGeUw3d00Q@mail.gmail.com>
 <517A6033.5060103@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <517A6033.5060103@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: sedat.dilek@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Michal, Sedat, All,

On Fri, Apr 26, 2013 at 01:08:35PM +0200, Michal Marek wrote:
> On 26.4.2013 12:49, Sedat Dilek wrote:
> > On Fri, Apr 26, 2013 at 12:37 PM, Sedat Dilek <sedat.dilek@gmail.co=
m> wrote:
> >> On Fri, Apr 26, 2013 at 12:35 PM, Sedat Dilek <sedat.dilek@gmail.c=
om> wrote:
> >>> On Fri, Apr 26, 2013 at 12:04 PM, Michal Marek <mmarek@suse.cz> w=
rote:
> >>>> On Fri, Apr 26, 2013 at 11:58:25AM +0200, Michal Marek wrote:
> >>>>> Can you send a copy of your .config?
> >>>>
> >>>> I can reproduce it as well:
> >>>>
> >>>> $ yes "" | make oldconfig
> >>>> ...
> >>>>   Enumeration method [M/y/?] (NEW)
> >>>>     Basic (RAPIDIO_ENUM_BASIC) [N/m/?] n
> >>>> ...
> >>>> #
> >>>> # configuration written to .config
> >>>> #
> >>>> $ make oldconfig
> >>>> ...
> >>>>   Enumeration method [M/y/?] (NEW)
> >>>>
> >>>>
> >>>> .config is attached.
> >>>>
> >>>
> >>> Mine, too.
> >>>
> >>> I hoped that -next release will be one w/o troubles
> >>> (cpufreq/intel_pstate / pm/timekeeping / ipc-sem-from-mmotm).
> >>> Unfortunately, I am not lucky :-(.
> >>>
> >>> Anyway, waiting for a fix.

I am even able to reproduce it with Linus' master:

    $ git checkout master   # This is Linus' master
    [--SNIP--]
    $ git rev-parse HEAD
    697dfd884438058b15032b0169887c742704434a
    $ git clean -dX; git clean -d
    [--SNIP--]
    $ cp ../linux-next.config .config
    $ make silentoldconfig </dev/null
    scripts/kconfig/conf --silentoldconfig Kconfig
    warning: (IA32_EMULATION) selects COMPAT_BINFMT_ELF which has unmet
    direct dependencies (COMPAT && BINFMT_ELF)
    *
    * Restart config...
    *
    *
    * Paravirtualized guest support
    *
    Paravirtualized guest support (PARAVIRT_GUEST) [N/y/?] (NEW) aborte=
d!

    Console input/output is redirected. Run 'make oldconfig' to update
    configuration.
                                                                       =
                                                                       =
                =E2=94=82
    make[1]: *** [silentoldconfig] Error 1
    make: *** [silentoldconfig] Error 2

I'm currently at work. I will look at it when I'm back home (as Michal
said, I'm GMT+2, so in about 5h from now).

> >> Just FYI: Mail delivery troubles!
[--SNIP--]
> >> 550 spam detected

Sorry, I have no grasp on how my ISP filters incoming emails... :-(

Regards,
Yann E. MORIN.

--=20
=2E-----------------.--------------------.------------------.----------=
----------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' cons=
piracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___       =
        |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There=
 is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   consp=
iracy.  |
'------------------------------^-------^------------------^------------=
--------'
