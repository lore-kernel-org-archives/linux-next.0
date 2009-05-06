From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next: parport: forgotten semicolon
Date: Wed, 6 May 2009 18:58:44 +0400
Message-ID: <a4423d670905060758x32774671o796ae46fbb43997c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760562AbZEFO7H@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@suse.de>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Greg

Please fix parport-remove-driver_data-direct-access-of-struct-device.patch

-       struct parport *p = dev_get_drvdata(&dev->dev)
+       struct parport *p = dev_get_drvdata(&dev->dev);
