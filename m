From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Sun, 9 Mar 2014 10:08:58 -0700
Message-ID: <CAOesGMhUVEEa6KLs2ZORxJunxitVdOQ5-wbs3KtEWBq+77t5JA@mail.gmail.com>
References: <20140309114134.502cdcae7e6a97db684d6b15@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140309114134.502cdcae7e6a97db684d6b15@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Mar 9, 2014 at 4:41 AM, Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> After merging the arm-soc tree, today's linux-next build (20140309)
> failed for multi_v7_defconfig like this:
>
> ERROR (phandle_references): Reference to non-existent node or label "sysmgr"
>
> ERROR (phandle_references): Reference to non-existent node or label "sysmgr"
>
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [arch/arm/boot/dts/socfpga_arria5_socdk.dtb] Error 2

Known issue, I unmerged the offending branch but didn't push out the
backed out for-next branch last night (I was unaware that you were
doing linux-next now, and sfr doesn't do them until Sunday night our
time, so I didn't think it was urgent).



-Olof
