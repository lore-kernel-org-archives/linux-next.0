From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: randconfig build error with next-20150318, in
 drivers/vfio/virqfd.c
Date: Wed, 18 Mar 2015 22:49:34 -0600
Message-ID: <1426740574.3643.435.camel@redhat.com>
References: <CA+r1ZhiQXJQY7h-9ThXwFztJkTnUX+ibF+VEtSQo8v0eLnUg+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhiQXJQY7h-9ThXwFztJkTnUX+ibF+VEtSQo8v0eLnUg+A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2015-03-18 at 15:57 -0700, Jim Davis wrote:
> Building with the attached random configuration file,
> 
> drivers/vfio/virqfd.c: In function 'vfio_virqfd_enable':
> drivers/vfio/virqfd.c:132:2: error: implicit declaration of function
> 'eventfd_ctx_fileget' [-Werror=implicit-function-declaration]
>   ctx = eventfd_ctx_fileget(irqfd.file);
>   ^
> drivers/vfio/virqfd.c:132:6: warning: assignment makes pointer from integer
> without a cast
>   ctx = eventfd_ctx_fileget(irqfd.file);
>       ^
>   CC      drivers/tty/serial/serial_core.o
> cc1: some warnings being treated as errors
> scripts/Makefile.build:258: recipe for target 'drivers/vfio/virqfd.o' failed

Thank you.  We've already got a patch posted on the mailing list that
will make this code dependent on CONFIG_EVENTFD.  Thanks,

Alex
