From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] linux-next: Tree for Jul 25 [ call-trace: drm |
 drm-intel related? ]
Date: Thu, 25 Jul 2013 17:31:50 +0100
Message-ID: <20130725163150.GD6493@cantiga.alporthouse.com>
References: <CA+icZUWOwKH+oF4Ekrkk3pUCjz4Rc361kzdsKjb04WzsEtWPYA@mail.gmail.com>
 <87bo5rx7m0.fsf@intel.com>
 <CA+icZUXhW_yAie25DPVXzhi2_pYQTjJpDqa7EzRfvtQ0gFYYHQ@mail.gmail.com>
 <20130725133651.GI5939@phenom.ffwll.local>
 <CA+icZUWxvBR6NX8JnqM1+4yVNfQ8ew5_7UCQ6yVpz8B4UibW7A@mail.gmail.com>
 <20130725142705.GM5939@phenom.ffwll.local>
 <CA+icZUU3+egkAVtSVEiOaqWK+7EFi572jGv2jUt=QDuGjbfZOw@mail.gmail.com>
 <CAKMK7uG-KCF5oU2XJ5UWPJn=V3i0jBLs5a=gU9UPuJxY0v=bNw@mail.gmail.com>
 <CA+icZUV-UM_9OSfGfYyb0-qZrFSuqeX-7BiPQ0NbyF7bADW-qA@mail.gmail.com>
 <CA+icZUWJDp6XQZs8hojVJOVyjC8NeV7QoQeFopNoUgwCaYHnSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUWJDp6XQZs8hojVJOVyjC8NeV7QoQeFopNoUgwCaYHnSQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 25, 2013 at 06:11:18PM +0200, Sedat Dilek wrote:
> Might be OT, but I cannot use my X graphics stack containing
> libdrm-2.4.46, mesa-9.1.5 and intel-ddx 2.21.12-git (tried also
> v2.21.11).
> Switching back to the one from Ubuntu/precise lets my X start.
> 
> 
> [    40.379] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
> [    40.379] (II) AIGLX: enabled GLX_INTEL_swap_event
> [    40.380] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
> [    40.380] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
> [    40.380] (II) AIGLX: Loaded and initialized i965
> [    40.380] (II) GLX: Initialized DRI2 GL provider for screen 0
> [    40.380]
> Fatal server error:
> [    40.380] failed to create screen resources
> [    40.380]
> Please consult the The X.Org Foundation support
>          at http://wiki.x.org
>  for help.
> [    40.380] Please also check the log file at "/var/log/Xorg.0.log"
> for additional information.
> [    40.380]
> [    40.380] (II) AIGLX: Suspending AIGLX clients for VT switch
> [    40.396]  ddxSigGiveUp: Closing log
> [    40.398] Server terminated with error (1). Closing log file.

Please attach the full Xorg.0.log so that I can make a few guesses.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
