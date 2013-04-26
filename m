From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: Tree for Apr 26
Date: Fri, 26 Apr 2013 11:58:25 +0200
Message-ID: <517A4FC1.3070605@suse.cz>
References: <20130426180357.7599d1b6b7965470905dcdf3@canb.auug.org.au> <CA+icZUWt_W5FUQgQ2TFoQU0df+sAbxZZE8AcD16T3f_fiTD9DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <CA+icZUWt_W5FUQgQ2TFoQU0df+sAbxZZE8AcD16T3f_fiTD9DQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
List-Id: linux-next.vger.kernel.org

Added Yann, from whom I merged couple of kconfig changes yesterday.

On 26.4.2013 11:42, Sedat Dilek wrote:
> [ CC linux-kbuild folks ]
> 
> I am always doing a ...
> 
>    $ cd linux-next/
> 
>    $ yes "" | make oldconfig
> 
> ... before starting a kernel-build.
> 
> Today, I see this ...
> 
> $ ./scripts/build_linux-next.sh
> make options ...... CC=gcc-4.6 -j4
> KBUILD_BUILD_USER=sedat.dilek@gmail.com
> LOCALVERSION=-next20130426-1-iniza-small
> dep-pkg options ... KDEB_PKGVERSION=3.9.0~rc8~next20130426-1~iniza+dileks1
> scripts/kconfig/conf --silentoldconfig Kconfig
> *
> * Restart config...
> *
[...]
>   Enumeration method [M/y/?] (NEW) aborted!
> 
> Console input/output is redirected. Run 'make oldconfig' to update
> configuration.
> 
> make[2]: *** [silentoldconfig] Error 1
> make[1]: *** [silentoldconfig] Error 2
> make: *** No rule to make target `include/config/auto.conf', needed by
> `include/config/kernel.release'.  Stop.
> 
> Had only a quick view!
> 
> Temp. workaround: cd build-dir, run manually 'make oldconfig'.
> 
> Explanations welcome :-)!

Can you send a copy of your .config?

Thanks,
Michal


