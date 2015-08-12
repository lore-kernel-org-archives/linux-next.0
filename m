From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH] Bluetooth: hci_bcm: Fix "implicit declaration"
Date: Wed, 12 Aug 2015 07:43:42 -0700
Message-ID: <DDBA5F0C-B6C8-440D-B098-F950E887B638@holtmann.org>
References: <1439376361-16647-1-git-send-email-frederic.danis@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439376361-16647-1-git-send-email-frederic.danis@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frederic Danis <frederic.danis@linux.intel.com>
Cc: linux-bluetooth@vger.kernel.org, sfr@canb.auug.org.au, "Gustavo F. Padovan" <gustavo@padovan.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Fred,

> The kbuild test robot reported implicit declaration of function
> 'acpi_dev_get_resources'.
> 
> Surround ACPI function by CONFIG_ACPI test.
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Frederic Danis <frederic.danis@linux.intel.com>
> ---
> drivers/bluetooth/hci_bcm.c | 7 +++++++
> 1 file changed, 7 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel
