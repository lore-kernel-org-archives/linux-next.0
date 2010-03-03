From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of the mfd tree with the i2c tree
Date: Wed, 3 Mar 2010 10:16:35 +0100
Message-ID: <20100303101635.18443234@hyperion.delvare>
References: <20100303144715.2b607ac1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100303144715.2b607ac1.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TcOhcnRvbiBOw6ltZXRo?= <nm127@freemail.hu>
List-Id: linux-next.vger.kernel.org

Hi Stephen, Samuel,

On Wed, 3 Mar 2010 14:47:15 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the mfd tree got a conflict in
> drivers/i2c/busses/i2c-isch.c between commit
> 482b522a6ced62506aba1c139cb9d4b73e7312f5 ("i2c: Make PCI device ids
> constant") from the i2c tree and commit
> 1fc8fe094a8ebcc09817246277250898a8d2fc5a ("i2c: convert i2c-isch to
> platform_device") from the mfd tree.
> 
> The latter removes the code modified by the former, so I used the latter.

I have sent a pull request to Linus yesterday for my i2c tree, which
includes the first patch mentioned above. As soon as Linus pulls from
it, Samuel will have to adjust the second patch to make it apply again.

-- 
Jean Delvare
