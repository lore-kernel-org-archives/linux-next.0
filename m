From: Fabio Estevam <festevam@gmail.com>
Subject: Re: DT parsing : duplicate name error
Date: Wed, 3 Dec 2014 14:04:16 -0200
Message-ID: <CAOMZO5AmA5-Ji6SDUv6b3qrhSi-KvSNYDV=ZaL7HoOhh-6SnsA@mail.gmail.com>
References: <CAL8zT=iXizKqJjWDcLT-chZ7=ioPYtQcB4GeqZpiL7kCpGOKZw@mail.gmail.com>
	<CACxGe6sRULEmOvdxFvR=Mcbf4Cgd3YijrJg1q9Uz1vgYw5tG+w@mail.gmail.com>
	<CAL8zT=geUOJnmUHvqyYk651U+HF3NSy3XU7hiWUn3gPX0sVjPg@mail.gmail.com>
	<CACxGe6skTZDe40eJN06BDapfKuN-KzMqgbEWNyLiTeXTt5dw5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6skTZDe40eJN06BDapfKuN-KzMqgbEWNyLiTeXTt5dw5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>, rafael.j.wysocki@intel.com, mika.westerberg@linux.intel.com, Bryan Wu <cooloney@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 3, 2014 at 1:41 PM, Grant Likely <grant.likely@secretlab.ca> wrote:

> From a quick reading of the backlog, for some reason the new device is
> getting assigned NULL as the device name in led_classdev_register().
> Probably because led_cdev->name is set to NULL. The leds are getting
> bound to the LED driver in gpio_led_probe() which is the non-DT path
> for creating LED devices. That would mean there is pdata attached to
> the LED device, but I haven't dug any farther than that. Really need
> the bisect to narrow down what is going on.

Ok, so this issue happens when two or more gpio-leds do not contain
the 'label' property.

'label' is an optional property according to
Documentation/devicetree/bindings/leds/common.txt:

"Optional properties for child nodes:
- label : The label for this LED.  If omitted, the label is
  taken from the node name (excluding the unit address)."

This works fine on 3.17.1 as we used to have this logic in leds-gpio:
led.name = of_get_property(child, "label", NULL) ? : child->name;

,but since commit a43f2cbbb009f96 ("leds: leds-gpio: Make use of
device property API "), this is no longer true:

 + fwnode_property_read_string(child, "label", &led.name);

If 'label' is not present then both of the LEDs will have the same
name and then the duplicate name error will happen.

So we would need something like this:

 if (fwnode_property_present(child, "label"))
       fwnode_property_read_string(child, "label", &led.name);
 else
     get the name from the child ---> This is what I am not sure how
to do after the conversion to use fwnode_handle.

Any ideas?

On linux-next I am only able to get two LEDs without 'label' property
to work if I do the following:

git checkout a43f2cbbb009f96
git revert a43f2cbbb009f96
git revert 5c51277a9ab
