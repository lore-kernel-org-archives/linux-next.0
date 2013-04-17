From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH] PCI: pci_bus_add_device() should succeed even if creating
 sysfs files fails
Date: Wed, 17 Apr 2013 10:30:12 -0700
Message-ID: <CAE9FiQWBXHgz-gWCmpWLaBOfQQJwtRZemV6Ut9GVw_KJ-dTGTA@mail.gmail.com>
References: <1366196798-15929-1-git-send-email-artem.savkov@gmail.com>
	<CAErSpo6uAbiJ5GtvOmoABvwSnWj3DRRrXB6K1PzQSnReFqbqxA@mail.gmail.com>
	<CAErSpo7nj3DQ-RB0UJdkzfN0L891xiTH8yzzcv7pW4AZ6waJ2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAErSpo7nj3DQ-RB0UJdkzfN0L891xiTH8yzzcv7pW4AZ6waJ2A@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Artem Savkov <artem.savkov@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 17, 2013 at 9:42 AM, Bjorn Helgaas <bhelgaas@google.com> wrote:
> It would be ideal if we could get rid of the pci_sysfs_init()
> late_initcall and just make the pci_create_sysfs_dev_files() from
> pci_bus_add_device() work all the time, even at boot-time.  I didn't
> look hard enough to figure out why this needs to be a late_initcall.

have to call that after pci assign unassigned resource.
