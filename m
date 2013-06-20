From: Ming Lei <ming.lei@canonical.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 driver-core.current tree
Date: Thu, 20 Jun 2013 08:23:30 +0800
Message-ID: <CACVXFVNsbBunNzYecUG34sFjPqRuzMHRTBD2Siy9d4RhqPnr3A@mail.gmail.com>
References: <20130619153225.9ff68f0984bfa54333c4df10@canb.auug.org.au>
	<CACVXFVMhVs7Wy1A=TfczYzHLFwyRPhEGW9Yo9hTERekaxSnpdQ@mail.gmail.com>
	<20130619143918.GC8413@kroah.com>
	<CACVXFVObBDwaounzZ7RyF=+QrQCBoEd0s-uLYFokksOzKgZSjA@mail.gmail.com>
	<20130619163628.GA28672@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130619163628.GA28672@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 20, 2013 at 12:36 AM, Greg KH <greg@kroah.com> wrote:
>
> Can you merge the two branches together (driver-core-next and
> driver-core-linus) and send me the proper merge patch that I should be
> applying when doing that?  Then I can push that out through the

Yes, I already merged the two branches together in my local repository,
and there is one merge commit, but I don't know how to generate/format
patch for this merge commit only:

commit e4b00d75ee3ed3af9fac83970d21e27d1ad4aa8d
Merge: bb07b00 8759793
Author: Ming Lei <tom.leiming@gmail.com>
Date:   Wed Jun 19 23:56:05 2013 +0800

    firmware loader: fix conflict driver-core-linus and driver-core-next

    Conflicts:
        drivers/base/firmware_class.c

Anyone who knows, please let me know, thanks.

Thanks,
--
Ming Lei
