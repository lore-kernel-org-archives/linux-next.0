From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Tue, 2 Oct 2018 12:04:23 +0200
Message-ID: <CAMRc=MdvRoKSFcYLednczDdZgCNr-nU634PgoZE2UdLXepUV6A@mail.gmail.com>
References: <20181002191236.0aa50539@canb.auug.org.au> <CAMRc=Mf64AMBiMwBTCYeG18txVqbdvkQA35ZyZuRtwOCe70RpA@mail.gmail.com>
 <dabf8577-418c-65bf-03b5-89f0236bc53e@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dabf8577-418c-65bf-03b5-89f0236bc53e@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-next.vger.kernel.org

wt., 2 pa=C5=BA 2018 o 11:56 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
>
>
> On 02/10/18 10:49, Bartosz Golaszewski wrote:
> > this looks like a false positive - this routine is used in
> > ./drivers/nvmem/core.c at line 943 in this revision.
> >
> Note that the caller is under
>   #if IS_ENABLED(CONFIG_OF)
> so this warning!
>
>
> --srini
>
> > Best regards,

Right. Let me fix that then.

Thanks!
Bartosz
