From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Fri, 15 Jul 2016 12:28:53 +1000
Message-ID: <20160715122853.2474113b@canb.auug.org.au>
References: <20160715121723.0f21f148@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160715121723.0f21f148@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Fri, 15 Jul 2016 12:17:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I fixed it up (I think, but it needs more work - see below) and can

For a start, it generates this warning, now:

drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defined but not used [-Wunused-function]
static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 level,
                   ^

-- 
Cheers,
Stephen Rothwell
