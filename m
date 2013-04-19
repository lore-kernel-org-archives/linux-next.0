From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Apr 18 [ call-trace: drm | x86 | smp | rcu
 related? ]
Date: Fri, 19 Apr 2013 14:39:54 -0700
Message-ID: <20130419213953.GN3479@linux.vnet.ibm.com>
References: <CAKMK7uFEaiT_1siQBcp_-S0RwLvy3XSjqLn1ksq70VhNTZSfLw@mail.gmail.com>
 <CA+icZUWQEiGecR8jgw4P-2YCKyqSDMMP0Ufwn8aBU_-AOf0a-Q@mail.gmail.com>
 <CA+icZUWcwvFFVesJDoFNT3DbgRMXvDp7QLn+S5Ze_5d8gJRx1g@mail.gmail.com>
 <CA+icZUXjTGSG+tejOAFgXr8EpKd7dL=-W41ha_-0N=roAxN3eg@mail.gmail.com>
 <CA+icZUVE-ikxEp65bUHMp0WEPX_MDbA06ykzeSxygJv=9f45ig@mail.gmail.com>
 <CA+icZUUp84vzF_0n77wsJ6dBOS26vSRCXaFUDbCQi-wG0b-Osg@mail.gmail.com>
 <517198A7.8020904@surriel.com>
 <1366402328.5317.9.camel@buesod1.americas.hpqcorp.net>
 <CA+icZUVjx7pDJWo3tGxX3ANXtiTP0_Q1YyOowANhn1wzcSgWaA@mail.gmail.com>
 <CA+55aFzU5C9UQGNFx+wQ_Rp0gZAAwLj77qO7fH7LEduD7bk1Kg@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+55aFzU5C9UQGNFx+wQ_Rp0gZAAwLj77qO7fH7LEduD7bk1Kg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Davidlohr Bueso <davidlohr.bueso@hp.com>, Rik van Riel <riel@surriel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Paul McKenney <paul.mckenney@linaro.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>, Emmanuel Benisty <benisty.e@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 19, 2013 at 02:24:10PM -0700, Linus Torvalds wrote:
> On Fri, Apr 19, 2013 at 2:09 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > I have applied all three patches and see still call-traces.
> > New are apparmor related messages.
> 
> Can you try the crazy rcu double-free debug hack?
> 
> See
> 
>     https://lkml.org/lkml/2013/3/30/113
> 
> and I'm re-attaching the ugly-ass crazy hack patch here too..
> 
>                     Linus

For whatever it is worth, CONFIG_DEBUG_OBJECTS_RCU_HEAD=y is intended to
detect RCU double-freeing.  But if it isn't helping for whatever reason,
please let me know!

							Thanx, Paul
