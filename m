From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Build error - vmlinux.lds [Re: linux-next: Tree for Jun 18]
Date: Wed, 18 Jun 2014 13:20:21 +0100
Message-ID: <20140618122020.GB32514@n2100.arm.linux.org.uk>
References: <CAK5sBcEpXboRVD-KzzjBJMi+LF-jhdt_HUYEz7wkJtFAv+BLcg@mail.gmail.com> <20140618115602.GA32514@n2100.arm.linux.org.uk> <CAK5sBcEg1XYQmzshxdLDHFCYFiawV0d8rt7aeAkPoiPhNMX1CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK5sBcEg1XYQmzshxdLDHFCYFiawV0d8rt7aeAkPoiPhNMX1CQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 18, 2014 at 05:38:14PM +0530, Sachin Kamat wrote:
> On Wed, Jun 18, 2014 at 5:26 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Wed, Jun 18, 2014 at 04:50:43PM +0530, Sachin Kamat wrote:
> >> Hi,
> >>
> >> I observe the following build error while building uImage for ARM.
> >>
> >>   Kernel: arch/arm/boot/Image is ready
> >> make[2]: *** No rule to make target
> >> `arch/arm/boot/compressed/vmlinux.lds', needed by
> >> `arch/arm/boot/compressed/vmlinux'.  Stop.
> >> make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
> >> make: *** [uImage] Error 2
> >
> > Works fine here against an empty object tree:
> >
> > http://www.arm.linux.org.uk/developer/build/file.php?lid=9591
> >
> > Are you building into an already-built object tree or rebuilding an
> > already built tree?
> 
> I did a clean build after updating the tree to next-20140618.
> git status show me the following after doing make clean
> 
> # On branch master
> # Changes not staged for commit:
> #   (use "git add/rm <file>..." to update what will be committed)
> #   (use "git checkout -- <file>..." to discard changes in working directory)
> #
> #    deleted:    arch/arm/boot/compressed/vmlinux.lds.S
> 
> 
> My tip of kernel points to commit 4ca1fbc122fcb ("Add linux-next specific
> files for 20140618")
> 
> >
> > This is likely caused by make getting confused over the dependencies.
> > I suggest making clean to recover from this error.
> 
> I get this error when I do a clean build too.

Hmm.  Please try removing vmlinux.lds.S from extra-y in
arch/arm/boot/compressed/Makefile and restoring the deleted file.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
