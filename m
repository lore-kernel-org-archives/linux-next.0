From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Tue, 2 Oct 2018 11:49:23 +0200
Message-ID: <CAMRc=Mf64AMBiMwBTCYeG18txVqbdvkQA35ZyZuRtwOCe70RpA@mail.gmail.com>
References: <20181002191236.0aa50539@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002191236.0aa50539@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: linux-next.vger.kernel.org

wt., 2 pa=C5=BA 2018 o 11:12 Stephen Rothwell <sfr@canb.auug.org.au> napisa=
=C5=82(a):
>
> Hi all,
>
> After merging the char-misc tree, today's linux-next build (i386
> defconfig) produced this warning:
>
> drivers/nvmem/core.c:496:1: warning: 'nvmem_find_cell_by_index' defined b=
ut not used [-Wunused-function]
>  nvmem_find_cell_by_index(struct nvmem_device *nvmem, int index)
>  ^~~~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>   e888d445ac33 ("nvmem: resolve cells from DT at registration time")
>
> --
> Cheers,
> Stephen Rothwell

Hi Stephen,

this looks like a false positive - this routine is used in
./drivers/nvmem/core.c at line 943 in this revision.

Best regards,
Bartosz Golaszewski
