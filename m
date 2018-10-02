From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Tue, 2 Oct 2018 10:56:21 +0100
Message-ID: <dabf8577-418c-65bf-03b5-89f0236bc53e@linaro.org>
References: <20181002191236.0aa50539@canb.auug.org.au>
 <CAMRc=Mf64AMBiMwBTCYeG18txVqbdvkQA35ZyZuRtwOCe70RpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Mf64AMBiMwBTCYeG18txVqbdvkQA35ZyZuRtwOCe70RpA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-next.vger.kernel.org



On 02/10/18 10:49, Bartosz Golaszewski wrote:
> this looks like a false positive - this routine is used in
> ./drivers/nvmem/core.c at line 943 in this revision.
> 
Note that the caller is under
  #if IS_ENABLED(CONFIG_OF)
so this warning!


--srini

> Best regards,
