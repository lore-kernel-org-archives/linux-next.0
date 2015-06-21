From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: randconfig build error with next-20150620,
 in drivers/staging/board/board.c
Date: Sun, 21 Jun 2015 01:34:30 -0400
Message-ID: <CAP=VYLq2RActzUYEjU6onUnrKgG_-djGk6jGrbZjStu1Zm2KJA@mail.gmail.com>
References: <CA+r1Zhhs+fFpmkvGgDDsR_k=fcMn37eJcJqTTr1Z18gZoRfdNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CA+r1Zhhs+fFpmkvGgDDsR_k=fcMn37eJcJqTTr1Z18gZoRfdNA@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: devel <devel@driverdev.osuosl.org>, Stephen Rothwell <sfr@canb.auug.org.au>, geert+renesas@glider.be, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sat, Jun 20, 2015 at 5:40 PM, Jim Davis <jim.epost@gmail.com> wrote:
> Building with the attached random configuration file,
>
> drivers/built-in.o: In function `board_staging_register_clock':
> /home/jim/linux/drivers/staging/board/board.c:131: undefined reference
> to `clk_add_alias'

Should be fixed once this gets applied:

https://lkml.org/lkml/2015/6/20/215

Paul.
--
